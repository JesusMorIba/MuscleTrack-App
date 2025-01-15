import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:muscle_track/core/provider/cloudinary_provider.dart';
import 'package:muscle_track/core/router/app_router_const.dart';
import 'package:muscle_track/core/theme/app_colors.dart';

class CustomWorkoutCard extends ConsumerWidget {
  final String title;
  final String duration;
  final String level;
  final String imageId;

  const CustomWorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.level,
    required this.imageId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    final cloudinaryService = ref.read(cloudinaryServiceProvider);
    final imageUrl = cloudinaryService.generateImageUrl(imageId);

    return InkWell(
      onTap: () {
        context.pushNamed(workoutDetailRoute);
      },
      child: Container(
        width: screenWidth * 0.95,
        height: 142,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$duration • $level",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
