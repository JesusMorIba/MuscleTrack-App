import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/core/router/app_router_const.dart';
import 'package:muscle_track/core/theme/app_colors.dart';

class CustomWorkoutCard extends StatefulWidget {
  final String title;
  final String duration;
  final String level;
  final String imageUrl;

  const CustomWorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.level,
    required this.imageUrl,
  });

  @override
  State<CustomWorkoutCard> createState() => _CustomWorkoutCardState();
}

class _CustomWorkoutCardState extends State<CustomWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        context.pushNamed(workoutDetailRoute);
      },
      child: Container(
        width: screenWidth * 0.95,
        height: 142,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [AppColors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${widget.duration} • ${widget.level}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
