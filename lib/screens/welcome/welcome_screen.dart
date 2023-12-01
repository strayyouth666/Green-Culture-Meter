import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_culture_meter/constants.dart';
import 'package:green_culture_meter/controllers/data_controller.dart';
import 'package:green_culture_meter/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final DataController _dataController = Get.put(DataController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController workUnitController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController workPeriodController = TextEditingController();

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 100), // You can use SizedBox for spacing
                Text(
                  "Let's Play Quiz!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text("Enter your information below"),
                const SizedBox(
                  height: 20,
                ),

                // Text fields
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Usia",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Jenis Kelamin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: educationController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: workUnitController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Unit Kerja",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: positionController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Jabatan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: workPeriodController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Masa Kerja",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Button
                InkWell(
                  onTap: () {
                    _dataController.saveUserData(
                      name: nameController.text,
                      age: ageController.text,
                      gender: genderController.text,
                      education: educationController.text,
                      workUnit: workUnitController.text,
                      position: positionController.text,
                      workPeriod: workPeriodController.text,
                    );
                    Get.to(QuizScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: const BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Let's Start Quiz",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
