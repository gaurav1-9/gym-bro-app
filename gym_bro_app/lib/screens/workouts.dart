import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsPage extends StatelessWidget {
  final Map<String, dynamic> workouts;
  const WorkoutsPage({
    super.key,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    print(workouts);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              size: 40.h,
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
