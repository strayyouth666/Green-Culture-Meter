import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';

class Option extends StatelessWidget {
  final int questionIndex;
  final int optionIndex;
  final String text; // Add a parameter for the text
  final VoidCallback press; // Add a parameter for the press callback

  const Option({
    required this.questionIndex,
    required this.optionIndex,
    required this.text, // Define the text parameter
    required this.press, // Define the press parameter
  });

  @override
  Widget build(BuildContext context) {
    final QuestionController _controller = Get.find<QuestionController>();
    final isSelected = _controller.isOptionSelected(questionIndex, optionIndex);
    final isAnswered = _controller.isQuestionAnswered(questionIndex);

    return ElevatedButton(
      onPressed: () {
        press(); // Call the provided press callback when the button is pressed
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected
              ? Colors.green
              : isAnswered
                  ? Colors.red
                  : Colors.white,
        ),
      ),
      child: Text(
        text, // Display the text provided through the parameter
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
