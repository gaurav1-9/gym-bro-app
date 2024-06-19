import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../properties/app_colors.dart';

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
    return ListView.builder(
      itemCount: exercise['exercises'].length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.done,
                  color: AppColor.silver,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  exercise['exercises']['ex${index + 1}'],
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColor.smokyBlack,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        );
      },
    );
  }
}
