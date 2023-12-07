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
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                "Part: ${question.part}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          Container(
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
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.previousQuestion();
                },
                icon: const Icon(Icons.fast_rewind),
                label: Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF858CA3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.nextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF729373),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Selanjutnya'),
                    SizedBox(width: 8),
                    Icon(Icons.fast_forward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
