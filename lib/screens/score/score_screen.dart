import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_culture_meter/constants.dart';

import '../../controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  final int totalPoints;
  ScoreScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController =
        Get.find<QuestionController>(); // Gunakan Get.find

    int totalPoints = _qnController.questions.fold(0, (total, question) {
      return total + question.pointValue.fold(0, (a, b) => a + b);
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Obx(() {
                return Text(
                  "$totalPoints Points",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: kSecondaryColor),
                );
              }),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
