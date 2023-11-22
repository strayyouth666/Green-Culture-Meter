import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/models/Questions_Lists.dart';
import 'package:green_culture_meter/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;
  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
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

  List<Question> get questions => this._questions;

  Map<int, int> selectedAnswers = {};
  Map<int, List<int>> selectedOptions = {};

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  bool isOptionSelected(int questionIndex, int optionIndex) {
    return selectedOptions.containsKey(questionIndex) &&
        selectedOptions[questionIndex]!.contains(optionIndex);
  }

  bool isQuestionAnswered(int questionIndex) {
    return selectedAnswers.containsKey(questionIndex);
  }

  late int _selectedQuestionIndex; // Track the current question index
  int get selectedQuestionIndex => this._selectedQuestionIndex;

  late int _selectedAnswerIndex; // Track the selected answer index
  int get selectedAnswerIndex => this._selectedAnswerIndex;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _totalPoints = 0;
  int get totalPoints => this._totalPoints;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
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
    for (int i = 0; i < _questions.length; i++) {
      if (selectedAnswers.containsKey(i)) {
        int answerIndex = selectedAnswers[i]!;
        total += _questions[i].pointValue[answerIndex];
      }
    }
    return total;
  }

  // Add a method to select or deselect an option
  // Add a method to toggle an answer option
  void toggleOption(int questionIndex, int optionIndex) {
    if (selectedOptions.containsKey(questionIndex)) {
      if (selectedOptions[questionIndex]!.contains(optionIndex)) {
        selectedOptions[questionIndex]!.remove(optionIndex);
      } else {
        selectedOptions[questionIndex]!.add(optionIndex);
      }
    } else {
      selectedOptions[questionIndex] = [optionIndex];
    }
    update();
  }

  // Add a method to select or deselect an option
  void selectOption(int questionIndex, int optionIndex) {
    if (selectedOptions.containsKey(questionIndex)) {
      if (selectedOptions[questionIndex]!.contains(optionIndex)) {
        selectedOptions[questionIndex]!.remove(optionIndex);
      } else {
        selectedOptions[questionIndex]!.add(optionIndex);
      }
    } else {
      selectedOptions[questionIndex] = [optionIndex];
    }
    update();
  }

  // Add a method to navigate to the previous question
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

  void selectAnswer(int questionIndex, int answerIndex) {
    selectedAnswers[questionIndex] = answerIndex;
    // Hitung total poin setelah jawaban dipilih
    _totalPoints = calculateTotalPoints();
    update();
  }

  void checkAns(int selectedIndex) {
    if (!_isAnswered) {
      _isAnswered = true;
      _selectedAnswerIndex = selectedIndex;
      update();
    }

    int? getSelectedAnswer(int questionIndex) {
      return selectedAnswers[questionIndex];
    }

    _animationController.stop();
    update();

    Future.delayed(Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      // Hitung total poin sebelum berpindah
      _totalPoints = calculateTotalPoints();
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen(totalPoints: _totalPoints)); // Pass _totalPoints here
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
