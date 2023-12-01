import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/controllers/data_controller.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';
import 'package:green_culture_meter/screens/quiz/quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  final QuestionController questionController = Get.find<QuestionController>();
  final int totalPoints;

  ScoreScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController) {
        String userName = dataController.name.value;
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: const Color(0x00e9e7f1),
              ),
              Column(
                children: [
                  const Spacer(flex: 3),
                  Text(
                    "Score",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    "$totalPoints Points",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white.withOpacity(0.5),
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                "Congratulation",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                userName,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Telah menyelesaikan Quiz Green Culture Meter dengan skor & predikat :",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$totalPoints",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(const QuizScreen());
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text('Coba Lagi'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
