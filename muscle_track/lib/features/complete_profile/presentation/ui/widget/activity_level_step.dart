import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';
import 'package:muscle_track/features/complete_profile/presentation/provider/complete_profile_provider.dart';
import 'package:muscle_track/features/complete_profile/presentation/state/complete_profile_state.dart';

class ActivityLevelStep extends ConsumerWidget {
  const ActivityLevelStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLevel = ref.watch(completeProfileProvider).activityLevel;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select Your Activity Level",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(color: AppColors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "Tell us about your daily activity level to tailor \nyour workouts accordingly.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyXLargeRegular(color: AppColors.grey700),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: ActivityLevel.values.map((level) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(completeProfileProvider.notifier)
                        .updateActivityLevel(level);
                  },
                  child: _ActivityLevelCard(
                    level: level,
                    isSelected: selectedLevel == level,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityLevelCard extends StatelessWidget {
  final ActivityLevel level;
  final bool isSelected;

  const _ActivityLevelCard({
    required this.level,
    required this.isSelected,
  });

  String _getTitle(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.sedentary:
        return "Sedentary";
      case ActivityLevel.lightlyActive:
        return "Lightly Active";
      case ActivityLevel.moderatelyActive:
        return "Moderately Active";
      case ActivityLevel.veryActive:
        return "Very Active";
      case ActivityLevel.athlete:
        return "Athlete";
    }
  }

  String _getSubtitle(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.sedentary:
        return "Little to no exercise";
      case ActivityLevel.lightlyActive:
        return "Exercise or sports 1-3 days a week";
      case ActivityLevel.moderatelyActive:
        return "Exercise or sports 3-5 days a week";
      case ActivityLevel.veryActive:
        return "Exercise or sports 6-7 days a week";
      case ActivityLevel.athlete:
        return "Physical job or training twice a day";
    }
  }

  Text _getIcon(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.sedentary:
        return Text('🧑‍💻', style: AppTextStyles.heading3());
      case ActivityLevel.lightlyActive:
        return Text('🚶', style: AppTextStyles.heading3());
      case ActivityLevel.moderatelyActive:
        return Text('🏃', style: AppTextStyles.heading3());
      case ActivityLevel.veryActive:
        return Text('🏋', style: AppTextStyles.heading3());
      case ActivityLevel.athlete:
        return Text('🏆', style: AppTextStyles.heading3());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.grey300,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        leading: _getIcon(level),
        title: Text(_getTitle(level),
            style: AppTextStyles.heading5(color: AppColors.black)),
        subtitle: Text(
          _getSubtitle(level),
          style: AppTextStyles.bodyMediumMedium(color: AppColors.grey700),
        ),
        trailing: isSelected
            ? const Icon(Icons.check, color: AppColors.primary)
            : null,
      ),
    );
  }
}
