import 'package:flutter/material.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          // ElevatedButton(
          //     onPressed: () => controller.nextQuestion(),
          //     child: const Text("Skip")),
        ],
      ),
      body: Body(
        key: UniqueKey(),
      ),
    );
  }
}
