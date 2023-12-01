import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';
import 'package:green_culture_meter/models/Questions_Lists.dart';
import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kBlackColor),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
              (index) {
                final uniqueKey = GlobalKey();
                return Option(
                  key: uniqueKey,
                  questionIndex: question.id,
                  optionIndex: index,
                  text: question.options[index],
                  press: () => controller.selectOption(question.id, index),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.nextQuestion();
              },
              child: const Text("Next"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.previousQuestion();
              },
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
