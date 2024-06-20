import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../properties/app_colors.dart';

class RestDay extends StatelessWidget {
  const RestDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Today is your",
            style: TextStyle(
              color: AppColor.silver,
              fontSize: 20.sp,
            ),
          ),
          Text(
            "Rest Day",
            style: TextStyle(
              color: AppColor.smokyBlack,
              fontSize: 45.sp,
            ),
          ),
          Image.asset(
            height: MediaQuery.of(context).size.height * .35,
            'assets/img/RestDay.png',
          ),
          SizedBox(
            height: 100.h,
          )
        ],
      ),
    );
  }
}
