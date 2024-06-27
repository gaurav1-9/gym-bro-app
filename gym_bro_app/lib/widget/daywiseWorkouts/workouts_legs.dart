import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../properties/app_colors.dart';

class Legs extends StatelessWidget {
  final Map<String, dynamic> workout;
  const Legs({
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
            Text(
              'Workout routine for',
              style: TextStyle(
                color: AppColor.silver,
                fontSize: 20.sp,
              ),
            ),
            Text(
              workout['targetMuscle'],
              style: TextStyle(
                color: AppColor.smokyBlack,
                fontSize: 45.sp,
                height: .8.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
