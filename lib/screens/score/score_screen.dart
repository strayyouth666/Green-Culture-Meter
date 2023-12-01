import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/constants.dart';

import '../quiz/quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int totalPoints;

  const ScoreScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                "$totalPoints Points",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
              InkWell(
                  onTap: () => Get.to(const QuizScreen()),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: const BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Let's Start Quiz",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
