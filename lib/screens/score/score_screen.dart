import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/constants.dart';
import 'package:green_culture_meter/controllers/data_controller.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';
import 'package:green_culture_meter/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  final QuestionController questionController = Get.find<QuestionController>();
  final int totalPoints;

  ScoreScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double threshold = totalPoints / 3;
    String grade = '';

    if (totalPoints >= threshold * 2) {
      grade = 'Green Master';
    } else if (totalPoints >= threshold) {
      grade = 'Green Learner';
    } else {
      grade = 'Green Newbie';
    }

    return GetBuilder<DataController>(
      builder: (dataController) {
        String userName = dataController.name.value;
        String position = dataController.position.value;
        String department = dataController.department.value;
        String nik = dataController.nik.value;
        return Scaffold(
          backgroundColor: const Color(0xFFE9E7F1),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 540,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/image1.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 540,
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                color: Colors.white.withOpacity(0),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(kDefaultPadding * 0.75),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Congratulations",
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    userName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "sebagai $position",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "dari $department",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    nik,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    "Telah menyelesaikan Quiz Green Cultur Meter dengan skor & predikat :",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "$totalPoints",
                                    style: const TextStyle(
                                      fontSize: 64.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    grade,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.to(WelcomeScreen());
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Coba Lagi',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF729373),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
