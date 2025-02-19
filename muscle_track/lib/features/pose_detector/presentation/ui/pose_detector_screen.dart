import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/pose_detector/data/source/local/exercise_type.dart';
import 'package:muscle_track/features/pose_detector/data/source/local/camera_service.dart';
import 'package:muscle_track/features/pose_detector/presentation/provider/pose_detector_provider.dart';
import 'package:muscle_track/features/pose_detector/presentation/state/pose_detector_state.dart';

class PoseDetectorScreen extends ConsumerStatefulWidget {
  final ExerciseType exerciseType;

  const PoseDetectorScreen({super.key, required this.exerciseType});

  @override
  PoseDetectorScreenState createState() => PoseDetectorScreenState();
}

class PoseDetectorScreenState extends ConsumerState<PoseDetectorScreen> {
  CameraService? cameraService;
  bool isDetecting = false;
  bool isDetectionActive = false;
  CameraDescription? selectedCamera;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras == null || cameras!.isEmpty) {
        throw Exception("No cameras found");
      }

      selectedCamera = cameras!.first;
      cameraService = CameraService(selectedCamera!);
      await cameraService?.initialize();

      if (!mounted) return;
      startImageStream();
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Failed to initialize camera: $e');
      }
    }
  }

  void switchCamera() async {
    if (cameras == null || cameras!.isEmpty) return;
    final currentIndex = cameras!.indexOf(selectedCamera!);
    final newIndex = (currentIndex + 1) % cameras!.length;
    selectedCamera = cameras![newIndex];

    await cameraService?.dispose();
    cameraService = CameraService(selectedCamera!);
    await cameraService?.initialize();
    setState(() {});
  }

  void startImageStream() {
    cameraService?.controller.startImageStream((image) async {
      if (isDetecting || !isDetectionActive) return;
      isDetecting = true;

      try {
        final inputImage = cameraService?.getInputImageFromCamera(image);
        if (inputImage != null) {
          await ref.read(poseDetectorProvider.notifier).detectPose(inputImage);
        } else {
          debugPrint('Error: InputImage is null');
        }
      } catch (e) {
        debugPrint('Error in pose detection: $e');
      } finally {
        if (mounted) {
          setState(() => isDetecting = false);
        }
      }
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final poseState = ref.watch(poseDetectorProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildCameraPreview(), // Cámara ocupa toda la pantalla
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: _buildHeader(),
          ),
          Positioned(
            bottom: 120,
            left: 16,
            right: 16,
            child: _buildInfoCard(poseState),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: _buildActionButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (cameraService?.controller == null ||
        !(cameraService?.controller.value.isInitialized ?? false)) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    return Positioned.fill(
      child: CameraPreview(cameraService!.controller),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        Text(widget.exerciseType.name,
            style: AppTextStyles.heading4().copyWith(color: Colors.white)),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/360.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 28,
            height: 28,
          ),
          onPressed: switchCamera,
        ),
      ],
    );
  }

  Widget _buildInfoCard(PoseDetectorState poseState) {
    return Card(
      elevation: 4,
      color: Colors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoItem(
                  SvgPicture.asset(
                    "assets/icons/repeat.svg",
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn),
                  ),
                  "Reps",
                  poseState.repCount.toString(),
                ),
                _infoItem(
                  SvgPicture.asset(
                    "assets/icons/timeline.svg",
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn),
                  ),
                  "RIR",
                  poseState.rirEstimate.toStringAsFixed(1),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("RIR Level", style: AppTextStyles.bodyMediumBold()),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: poseState.rirEstimate / 10,
                  backgroundColor: Colors.grey[300],
                  color: AppColors.primary,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              poseState.feedbackMessage,
              style: AppTextStyles.bodyMediumRegular(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(Widget icon, String title, String value) {
    return Column(
      children: [
        SizedBox(height: 32, width: 32, child: icon),
        const SizedBox(height: 4),
        Text(title, style: AppTextStyles.bodyMediumBold()),
        Text(value, style: AppTextStyles.heading5()),
      ],
    );
  }

  Widget _buildActionButton() {
    return CustomElevatedButton(
      text: isDetectionActive ? "Stop Detection" : "Start Detection",
      onPressed: () => setState(() => isDetectionActive = !isDetectionActive),
    );
  }

  @override
  void dispose() {
    cameraService?.dispose();
    super.dispose();
  }
}
