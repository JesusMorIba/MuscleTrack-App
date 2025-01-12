import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PoseDetectorProvider extends ChangeNotifier {
  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
    ),
  );

  int squatCount = 0;
  bool isSquatStarted = false;
  String feedbackMessage = '';
  double rirEstimate = 0;

  Future<void> detectPose(InputImage inputImage) async {
    try {
      final poses = await _poseDetector.processImage(inputImage);

      if (poses.isEmpty) {
        feedbackMessage = 'No pose detected';
        notifyListeners();
        return;
      }

      final pose = poses.first;

      final leftHip = pose.landmarks[PoseLandmarkType.leftHip];
      final rightHip = pose.landmarks[PoseLandmarkType.rightHip];
      final leftKnee = pose.landmarks[PoseLandmarkType.leftKnee];
      final rightKnee = pose.landmarks[PoseLandmarkType.rightKnee];
      final leftAnkle = pose.landmarks[PoseLandmarkType.leftAnkle];
      final rightAnkle = pose.landmarks[PoseLandmarkType.rightAnkle];

      if (leftHip == null ||
          rightHip == null ||
          leftKnee == null ||
          rightKnee == null ||
          leftAnkle == null ||
          rightAnkle == null) {
        feedbackMessage = 'Pose incompleta detectada';
        notifyListeners();
        return;
      }

      String correctionFeedback = '';

      // Verificar la posición de las rodillas y caderas
      if (!isKneesAligned(leftKnee, rightKnee, leftAnkle, rightAnkle)) {
        correctionFeedback += '\nMantén las rodillas alineadas con los pies.';
      }

      // Verificar inclinación del torso
      if (isTorsoLeaningTooForward(leftHip, rightHip, leftKnee, rightKnee)) {
        correctionFeedback +=
            '\nEvita inclinar demasiado el torso hacia adelante.';
      }

      // Verificar profundidad de la sentadilla
      if (!isSquatDeepEnough(leftHip, rightHip, leftKnee, rightKnee)) {
        correctionFeedback +=
            '\nBaja más para alcanzar la profundidad correcta.';
      }

      // Verificar que los talones no se levanten
      if (areHeelsLifted(leftAnkle, rightAnkle)) {
        correctionFeedback += '\nMantén los talones en el suelo.';
      }

      if (isSquat(
          leftHip, rightHip, leftKnee, rightKnee, leftAnkle, rightAnkle)) {
        if (!isSquatStarted) {
          squatCount++;
          isSquatStarted = true;

          // Calcular el RIR basado en la profundidad de la sentadilla
          rirEstimate = estimateRIR(
              leftHip, rightHip, leftKnee, rightKnee, leftAnkle, rightAnkle);
          feedbackMessage =
              'Sentadilla detectada! Repeticiones: $squatCount, RIR estimado: ${rirEstimate.toStringAsFixed(1)}';

          if (correctionFeedback.isNotEmpty) {
            feedbackMessage += correctionFeedback;
          }

          notifyListeners();
        }
      } else {
        isSquatStarted = false;
        feedbackMessage = correctionFeedback.isNotEmpty
            ? correctionFeedback
            : 'Ajusta tu postura para realizar una sentadilla completa';
        notifyListeners();
      }
    } catch (e) {
      feedbackMessage = 'Error detecting pose: ${e.toString()}';
      debugPrint(feedbackMessage);
      notifyListeners();
    }
  }

  // Verificar que las rodillas estén alineadas con los tobillos para evitar el valgo de rodillas
  bool isKneesAligned(PoseLandmark leftKnee, PoseLandmark rightKnee,
      PoseLandmark leftAnkle, PoseLandmark rightAnkle) {
    double kneeDistance = (leftKnee.x - rightKnee.x).abs();
    double ankleDistance = (leftAnkle.x - rightAnkle.x).abs();
    return kneeDistance >=
        ankleDistance * 0.9; // Ajusta el ratio según necesidad
  }

  // Verificar inclinación del torso hacia adelante
  bool isTorsoLeaningTooForward(PoseLandmark leftHip, PoseLandmark rightHip,
      PoseLandmark leftKnee, PoseLandmark rightKnee) {
    return (leftHip.y + rightHip.y) / 2 < (leftKnee.y + rightKnee.y) / 2 * 1.2;
  }

  // Verificar que la sentadilla sea lo suficientemente profunda
  bool isSquatDeepEnough(PoseLandmark leftHip, PoseLandmark rightHip,
      PoseLandmark leftKnee, PoseLandmark rightKnee) {
    return (leftHip.y + rightHip.y) / 2 > (leftKnee.y + rightKnee.y) / 2;
  }

  // Verificar que los talones no se levanten
  bool areHeelsLifted(PoseLandmark leftAnkle, PoseLandmark rightAnkle) {
    return leftAnkle.y < (leftAnkle.y + rightAnkle.y) / 2 * 0.95 ||
        rightAnkle.y < (leftAnkle.y + rightAnkle.y) / 2 * 0.95;
  }

  // Método para determinar si la pose detectada corresponde a una sentadilla
  bool isSquat(
      PoseLandmark leftHip,
      PoseLandmark rightHip,
      PoseLandmark leftKnee,
      PoseLandmark rightKnee,
      PoseLandmark leftAnkle,
      PoseLandmark rightAnkle) {
    bool kneesBent = leftKnee.y > leftHip.y && rightKnee.y > rightHip.y;
    bool hipsLowerThanKnees =
        leftHip.y > leftKnee.y && rightHip.y > rightKnee.y;

    return kneesBent && hipsLowerThanKnees;
  }

  // Estimar el RIR (Reps In Reserve) basado en la profundidad de la sentadilla
  double estimateRIR(
      PoseLandmark leftHip,
      PoseLandmark rightHip,
      PoseLandmark leftKnee,
      PoseLandmark rightKnee,
      PoseLandmark leftAnkle,
      PoseLandmark rightAnkle) {
    double hipToKneeDistance =
        ((leftHip.y + rightHip.y) / 2) - ((leftKnee.y + rightKnee.y) / 2);
    double kneeToAnkleDistance =
        ((leftKnee.y + rightKnee.y) / 2) - ((leftAnkle.y + rightAnkle.y) / 2);
    double depthRatio = hipToKneeDistance / kneeToAnkleDistance;

    if (depthRatio > 1.2) {
      return 4.0; // Sentadilla parcial: RIR alto
    } else if (depthRatio > 0.8) {
      return 2.0; // Sentadilla media
    } else {
      return 1.0; // Sentadilla profunda
    }
  }

  // Reiniciar el contador de sentadillas y el mensaje de retroalimentación
  void resetCounter() {
    squatCount = 0;
    feedbackMessage = 'Contador reiniciado';
    rirEstimate = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    _poseDetector.close();
    super.dispose();
  }
}
