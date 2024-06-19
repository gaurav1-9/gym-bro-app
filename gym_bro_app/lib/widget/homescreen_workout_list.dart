import 'package:flutter/material.dart';

class WorkoutList extends StatefulWidget {
  final int workoutDay;
  final Map<String, dynamic> workouts;
  const WorkoutList({
    super.key,
    required this.workouts,
    required this.workoutDay,
  });

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  late Map<String, dynamic> exercise;
  @override
  void initState() {
    super.initState();
    exercise = widget.workouts['day-${widget.workoutDay}'];
  }

  @override
  Widget build(BuildContext context) {
    print(exercise['exercises'].values);
    return ListView.builder(
      itemCount: exercise['exercises'].length,
      itemBuilder: (ctx, index) {
        return Text(exercise['exercises']['ex${index + 1}']);
      },
    );
  }
}
