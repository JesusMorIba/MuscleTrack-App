import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:muscle_track/features/pose_detector/presentation/state/pose_detector_state.dart';
import 'dart:math';

final poseDetectorProvider =
    AutoDisposeNotifierProvider<PoseDetectorNotifier, PoseDetectorState>(
        PoseDetectorNotifier.new);

class PoseDetectorNotifier extends AutoDisposeNotifier<PoseDetectorState> {
  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(model: PoseDetectionModel.accurate),
  );

  Map<String, PoseLandmark?> previousLandmarks = {};
  DateTime? lastSquatTime;
  double squatSpeed = 0;

  @override
  PoseDetectorState build() {
    return PoseDetectorState();
  }

  Future<void> detectPose(InputImage inputImage) async {
    try {
      final poses = await _poseDetector.processImage(inputImage);
      if (poses.isEmpty) {
        state = state.copyWith(feedbackMessage: 'No pose detected');
        return;
      }

      final pose = poses.first;
      var landmarks = extractLandmarks(pose);
      landmarks = smoothLandmarks(landmarks, previousLandmarks);
      previousLandmarks = landmarks;

      if (landmarks.values.any((landmark) => landmark == null)) {
        state = state.copyWith(feedbackMessage: 'Incomplete pose detected');
        return;
      }

      bool isCurrentlySquatting = isSquat(landmarks);
      bool isFullyStanding = isStanding(landmarks);
      String correctionFeedback = squatFeedback(landmarks);

      if (isCurrentlySquatting) {
        updateSquatSpeed();
        state = state.copyWith(
          feedbackMessage: squatSpeed < 1.5 ? 'Slow down!' : 'Good speed!',
        );
        if (!state.isExerciseStarted) {
          state = state.copyWith(
            isExerciseStarted: true,
            isBottomPositionReached: true,
            feedbackMessage: correctionFeedback.isNotEmpty
                ? correctionFeedback
                : 'Good squat!',
          );
        }
      } else if (state.isExerciseStarted &&
          state.isBottomPositionReached &&
          isFullyStanding) {
        state = state.copyWith(
          repCount: state.repCount + 1,
          isExerciseStarted: false,
          isBottomPositionReached: false,
          rirEstimate: estimateRIR(landmarks),
          feedbackMessage: 'Great! Keep going!',
        );
      }
    } catch (e) {
      state = state.copyWith(
          feedbackMessage: 'Error detecting pose: ${e.toString()}');
    }
  }

  Map<String, PoseLandmark?> extractLandmarks(Pose pose) {
    return {
      'leftHip': pose.landmarks[PoseLandmarkType.leftHip],
      'rightHip': pose.landmarks[PoseLandmarkType.rightHip],
      'leftKnee': pose.landmarks[PoseLandmarkType.leftKnee],
      'rightKnee': pose.landmarks[PoseLandmarkType.rightKnee],
      'leftAnkle': pose.landmarks[PoseLandmarkType.leftAnkle],
      'rightAnkle': pose.landmarks[PoseLandmarkType.rightAnkle],
      'leftShoulder': pose.landmarks[PoseLandmarkType.leftShoulder],
      'rightShoulder': pose.landmarks[PoseLandmarkType.rightShoulder],
    };
  }

  Map<String, PoseLandmark?> smoothLandmarks(
      Map<String, PoseLandmark?> current, Map<String, PoseLandmark?> previous) {
    if (previous.isEmpty) return current;
    return current.map((key, value) {
      if (value == null || previous[key] == null) return MapEntry(key, value);
      return MapEntry(
          key,
          PoseLandmark(
            type: value.type,
            x: (value.x + previous[key]!.x) / 2,
            y: (value.y + previous[key]!.y) / 2,
            z: (value.z + previous[key]!.z) / 2,
            likelihood: (value.likelihood + previous[key]!.likelihood) / 2,
          ));
    });
  }

  bool isSquat(Map<String, PoseLandmark?> lm) {
    return calculateAngle(lm['leftHip'], lm['leftKnee'], lm['leftAnkle']) < 100;
  }

  bool isStanding(Map<String, PoseLandmark?> lm) {
    return lm['leftHip']!.y < lm['leftKnee']!.y * 0.9 &&
        lm['rightHip']!.y < lm['rightKnee']!.y * 0.9;
  }

  String squatFeedback(Map<String, PoseLandmark?> lm) {
    String feedback = '';
    if (!isSquatDeepEnough(lm)) feedback += '\nGo deeper in the squat.';
    if (areHeelsLifted(lm)) feedback += '\nKeep your heels on the ground.';
    if (isLeaningTooMuch(lm)) feedback += '\nKeep your chest upright.';
    if (!isSquatSymmetric(lm)) feedback += '\nTry to keep both sides balanced.';
    return feedback;
  }

  bool isSquatDeepEnough(Map<String, PoseLandmark?> lm) {
    return calculateAngle(lm['leftHip'], lm['leftKnee'], lm['leftAnkle']) < 100;
  }

  bool areHeelsLifted(Map<String, PoseLandmark?> lm) {
    return lm['leftAnkle']!.y < lm['leftKnee']!.y * 0.95 ||
        lm['rightAnkle']!.y < lm['rightKnee']!.y * 0.95;
  }

  bool isLeaningTooMuch(Map<String, PoseLandmark?> lm) {
    return calculateAngle(lm['leftShoulder'], lm['leftHip'], lm['leftKnee']) <
        45;
  }

  bool isSquatSymmetric(Map<String, PoseLandmark?> lm) {
    return (lm['leftHip']!.y -
                lm['leftKnee']!.y -
                (lm['rightHip']!.y - lm['rightKnee']!.y))
            .abs() <
        10;
  }

  double calculateAngle(PoseLandmark? a, PoseLandmark? b, PoseLandmark? c) {
    if (a == null || b == null || c == null) return 180;
    double radians =
        (atan2(c.y - b.y, c.x - b.x) - atan2(a.y - b.y, a.x - b.x)).abs();
    double angle = radians * (180 / pi);
    return angle > 180 ? 360 - angle : angle;
  }

  void updateSquatSpeed() {
    DateTime now = DateTime.now();
    if (lastSquatTime != null) {
      squatSpeed = now.difference(lastSquatTime!).inMilliseconds / 1000.0;
    }
    lastSquatTime = now;
  }

  double estimateRIR(Map<String, PoseLandmark?> lm) {
    return calculateAngle(lm['leftHip'], lm['leftKnee'], lm['leftAnkle']) < 90
        ? 1.0
        : 3.0;
  }

  void resetCounter() {
    state = state.copyWith(
        repCount: 0, feedbackMessage: 'Counter reset', rirEstimate: 0);
  }
}
