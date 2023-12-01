import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';

class Option extends StatelessWidget {
  final int questionIndex;
  final int optionIndex;
  final String text;
  final VoidCallback press;

  const Option({
    Key? key,
    required this.questionIndex,
    required this.optionIndex,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.find<QuestionController>();
    final bool isSelected =
        controller.isOptionSelected(questionIndex, optionIndex);

    return ElevatedButton(
      onPressed: () {
        controller.selectOption(questionIndex, optionIndex);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Colors.green : Colors.white,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
