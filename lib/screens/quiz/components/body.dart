import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/constants.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    required key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ProgressBar(
              key: UniqueKey(),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text: "${questionController.questionNumber} ",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                  children: [
                    TextSpan(
                      text: "/${questionController.questions.length}",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: questionController.pageController,
              onPageChanged: questionController.updateTheQnNum,
              itemCount: questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                question: questionController.questions[index],
                key: UniqueKey(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
