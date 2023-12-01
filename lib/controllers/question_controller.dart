import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/models/Questions_Lists.dart';
import 'package:green_culture_meter/screens/score/score_screen.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;
  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
          part: question['part'],
          id: question['id'],
          question: question['question'],
          options: List<String>.from(question['options']),
          pointValue: List<int>.from(question['point_value']),
          answer: 0,
        ),
      )
      .toList();

  List<Question> get questions => _questions;

  Map<int, int> selectedAnswers = {};
  Map<int, List<int>> selectedOptions = {};

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  bool isOptionSelected(int questionIndex, int optionIndex) {
    return selectedOptions.containsKey(questionIndex) &&
        selectedOptions[questionIndex]!.contains(optionIndex);
  }

  bool isQuestionAnswered(int questionIndex) {
    return selectedAnswers.containsKey(questionIndex);
  }

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _totalPoints = 0;
  int get totalPoints => _totalPoints;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  int calculateTotalPoints() {
    int total = 0;

    if (_questions.isEmpty) {
      print('Questions list is empty!');
    }

    if (selectedAnswers.isEmpty) {
      print('No selected answers yet!');
    }

    for (int i = 0; i < _questions.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        int answerIndex = selectedAnswers[i]!;
        print('Question $i Answer Index: $answerIndex');
        print(
            'Question $i Point Value: ${_questions[i].pointValue[answerIndex]}');

        total += _questions[i].pointValue[answerIndex];
        print('Total after Question $i: $total');
      }
    }

    print('Final Total Points: $total');
    return total;
  }

  void selectOption(int questionIndex, int answerIndex) {
    selectedAnswers[questionIndex] = answerIndex;
    selectedOptions[questionIndex] = [answerIndex];
    _totalPoints = calculateTotalPoints();
    update();
    nextQuestion();
  }

  void checkAns(int selectedIndex) {
    if (!_isAnswered) {
      _isAnswered = true;
      update();
    }

    _animationController.stop();
    update();

    Future.delayed(const Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void previousQuestion() {
    if (_questionNumber.value > 1) {
      _questionNumber.value--; // Decrease the current question number.
      _isAnswered =
          false; // You may want to reset _isAnswered to false or as needed.
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      // You may need to reset the animation or do other necessary tasks.
    }
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _totalPoints = calculateTotalPoints();

      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      navigateToScoreScreen();
    }
  }

  void navigateToScoreScreen() {
    Get.to(ScoreScreen(totalPoints: _totalPoints));
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
