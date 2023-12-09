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
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: const Color(0xFF1B1F31),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFFEFE), width: 1),
            ),
            child: Column(
              children: [
                Text(
                  question.question,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                ...List.generate(
                  question.options.length,
                  (index) {
                    final uniqueKey = GlobalKey();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Option(
                        key: uniqueKey,
                        questionIndex: question.id,
                        optionIndex: index,
                        text: question.options[index],
                        press: () =>
                            controller.selectOption(question.id, index),
                      ),
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.previousQuestion();
                },
                icon: const Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                ),
                label: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
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
              height: 60,
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
                    Text(
                      'Selanjutnya',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.fast_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
