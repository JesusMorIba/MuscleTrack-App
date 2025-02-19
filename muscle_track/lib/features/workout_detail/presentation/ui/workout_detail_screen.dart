import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_track/features/workout_detail/presentation/provider/workout_detail_provider.dart';

import 'package:muscle_track/features/workout_detail/presentation/ui/widget/workout_detail_list.dart';

class WorkoutDetailScreen extends ConsumerStatefulWidget {
  final String workoutId;

  const WorkoutDetailScreen(this.workoutId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends ConsumerState<WorkoutDetailScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref
        .read(workoutDetailProvider.notifier)
        .getWorkoutDetailById(widget.workoutId);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WorkoutDetailList(),
      ),
    );
  }
}
