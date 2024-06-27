import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../workouts_headings.dart';

class Shoulders extends StatelessWidget {
  final Map<String, dynamic> workout;
  const Shoulders({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        children: [
          WorkoutListHeading(
            workoutType: workout['targetMuscle'],
          ),
        ],
      ),
    );
  }
}
