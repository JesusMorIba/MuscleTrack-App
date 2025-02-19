import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/common/common.dart';
import 'package:muscle_track/core/router/app_router_const.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/home/presentation/provider/home_provider.dart';
import 'package:muscle_track/features/home/presentation/state/home_state.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.event == HomeEvent.error) {
      return Center(child: Text('Error: ${state.error}'));
    }

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                fit: BoxFit.contain,
              ),
            ),
            hintText: 'Search workout plan...',
            hintStyle: AppTextStyles.bodyXLargeRegular(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.grey100,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Workout Plan For You",
          style: AppTextStyles.heading5(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.workouts.length,
          itemBuilder: (context, index) {
            final workout = state.workouts[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(workoutDetailRoute,
                        pathParameters: {'id': workout.id.toString()});
                  },
                  child: CustomWorkoutCard(
                    title: workout.title,
                    duration: workout.minutes.toString(),
                    level: workout.level,
                    imageUrl: workout.cover,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
        Text(
          "Body Focus Area",
          style: AppTextStyles.heading5(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: const [
            CustomFocusAreaCard(
                title: "Shoulders", image: "assets/images/shoulders.png"),
            CustomFocusAreaCard(
                title: "Chest", image: "assets/images/chest.png"),
            CustomFocusAreaCard(title: "Arms", image: "assets/images/arms.png"),
            CustomFocusAreaCard(title: "Back", image: "assets/images/back.png"),
            CustomFocusAreaCard(
                title: "Stomach", image: "assets/images/stomach.png"),
            CustomFocusAreaCard(title: "Legs", image: "assets/images/legs.png"),
          ],
        ),
      ],
    );
  }
}
