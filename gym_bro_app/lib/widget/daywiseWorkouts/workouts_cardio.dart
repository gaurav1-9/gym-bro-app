import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../properties/app_colors.dart';
import '../homescreen_appbar.dart';
import '../workouts_headings.dart';

class Cardio extends StatelessWidget {
  final Map<String, dynamic> workout;
  const Cardio({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutListHeading(
              workoutType: workout['targetMuscle'],
            ),
          ],
        ),
      ],
    );
  }
}
