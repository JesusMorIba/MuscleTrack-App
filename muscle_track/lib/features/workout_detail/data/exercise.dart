import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

abstract class Exercise {
  int repetitionCount = 0;
  String feedbackMessage = '';

  void detectRepetition(Pose pose);

  String giveFeedback();

  void resetCounter() {
    repetitionCount = 0;
    feedbackMessage = '';
  }
}
