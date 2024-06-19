import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../properties/app_colors.dart';

class WorkoutLoader extends StatelessWidget {
  const WorkoutLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/Gym-amico.png',
            height: MediaQuery.of(context).size.height * .35,
          ),
          Wrap(
            children: [
              Text(
                "Hold on...",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.smokyBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.7.w,
                  color: AppColor.smokyBlack,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}