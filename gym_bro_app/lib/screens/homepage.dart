import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../widget/homescreen_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool workoutLoading = true;
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
    getWorkouts();
  }

  Future<void> getWorkouts() async {
    String workoutsURL =
        "https://gym-bro-ef156-default-rtdb.firebaseio.com/workouts.json";
    final response = await http.get(Uri.parse(workoutsURL));
    try {
      if (jsonDecode(response.body) != null) {
        setState(() {
          workoutLoading = false;
        });
        print(jsonDecode(response.body));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (!workoutLoading)
          ? Padding(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              child: Column(
                children: [
                  WorkoutHeading(
                    workoutType: workoutType[day.weekday - 1],
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
