import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/constants.dart';
import 'package:green_culture_meter/controllers/data_controller.dart';
import 'package:green_culture_meter/controllers/question_controller.dart';
import 'package:green_culture_meter/screens/welcome/welcome_screen.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ScoreScreen extends StatefulWidget {
  final int totalPoints;

  ScoreScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final GlobalKey _globalKey = GlobalKey();
  final QuestionController questionController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    double threshold = widget.totalPoints / 3;
    String grade = '';

    if (widget.totalPoints >= threshold * 2) {
      grade = 'Green Master';
    } else if (widget.totalPoints >= threshold) {
      grade = 'Green Learner';
    } else {
      grade = 'Green Newbie';
    }

    return GetBuilder<DataController>(
      builder: (dataController) {
        String userName = dataController.name.value;
        String position = dataController.position.value;
        String department = dataController.department.value;
        String nik = dataController.nik.value;
        return Scaffold(
          backgroundColor: const Color(0xFFE9E7F1),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  RepaintBoundary(
                    key: _globalKey,
                    child: SizedBox(
                      width: double.infinity,
                      height: 540,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/image1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 540,
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter:
                                    ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Colors.white.withOpacity(0),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    kDefaultPadding * 0.75),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Congratulations",
                                      style: TextStyle(
                                        fontSize: 36.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      userName,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "sebagai $position",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "dari $department",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      nik,
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "Telah menyelesaikan Quiz Green Cultur Meter dengan skor & predikat :",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${widget.totalPoints}",
                                      style: const TextStyle(
                                        fontSize: 64.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      grade,
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        saveWidget();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5E609E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Simpan  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(WelcomeScreen());
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
                            'Home  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> saveWidget() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final result = await ImageGallerySaver.saveImage(pngBytes);

      if (result['isSuccess']) {
        print('Image saved to gallery');
      } else {
        print('Failed to save image to gallery');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
