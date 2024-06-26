import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../properties/loader.dart';
import '../widget/homescreen_appbar.dart';
import '../widget/homescreen_loader.dart';
import '../widget/homescreen_rest_day.dart';
import '../widget/homescreen_workout_list.dart';
import 'workouts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LoaderStatus workoutLoading = LoaderStatus.isLoading;
  Map<String, dynamic> workouts = {};
  late DateTime day;
  List<String> workoutType = [
    'Shoulders',
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
    if (day.hour == 00) {
      resetSharedPref();
    }
    getWorkouts();
  }

  MaterialPageRoute workoutsPage() {
    return MaterialPageRoute(
      builder: (context) => WorkoutsPage(
        workouts: workouts,
      ),
    );
  }

  Future<void> resetSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  Future<void> getWorkouts() async {
    setState(() {
      workoutLoading = LoaderStatus.isLoading;
    });
    String workoutsURL =
        "https://gym-bro-ef156-default-rtdb.firebaseio.com/workouts.json";
    try {
      final response = await http
          .get(Uri.parse(workoutsURL))
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        if (jsonDecode(response.body) != null) {
          setState(() {
            workoutLoading = LoaderStatus.notLoading;
          });
          workouts = jsonDecode(response.body);
        }
      }
    } on TimeoutException catch (_) {
      setState(() {
        workoutLoading = LoaderStatus.errorLoading;
      });
    } catch (e) {
      setState(() {
        workoutLoading = LoaderStatus.noNetwork;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (workoutLoading == LoaderStatus.notLoading)
          ? Padding(
              padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
              child: (day.weekday == 7)
                  ? const RestDay()
                  : Column(
                      children: [
                        WorkoutHeading(
                          workoutType: workoutType[day.weekday - 1],
                          workoutsPage: workoutsPage,
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Expanded(
                          child: WorkoutList(
                            workouts: workouts,
                            workoutDay: day.weekday,
                          ),
                        ),
                      ],
                    ),
            )
          : WorkoutLoader(
              workoutLoading: workoutLoading,
              tryAgain: getWorkouts,
            ),
    );
  }
}
