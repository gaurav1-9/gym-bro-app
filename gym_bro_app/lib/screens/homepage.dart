import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/homescreen_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late DateTime day;
  List<String> workoutType = [
    'Shoulder',
    'Chest',
    'Back',
    'Arms',
    'Legs',
    'Cardio',
  ];
  @override
  void initState() {
    super.initState();
    day = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            WorkoutHeading(
              workoutType: workoutType[day.weekday - 1],
            ),
          ],
        ),
      ),
    );
  }
}
