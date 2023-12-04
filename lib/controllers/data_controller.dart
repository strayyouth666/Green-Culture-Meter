import 'package:get/get.dart';

class DataController extends GetxController {
  RxString name = ''.obs;
  RxString age = ''.obs;
  RxString gender = ''.obs;
  RxString education = ''.obs;
  RxString workUnit = ''.obs;
  RxString position = ''.obs;
  RxString workPeriod = ''.obs;

  void saveUserData({
    required String name,
    required String age,
    required String gender,
    required String education,
    required String workUnit,
    required String position,
    required String workPeriod,
  }) {
    this.name.value = name;
    this.age.value = age;
    this.gender.value = gender;
    this.education.value = education;
    this.workUnit.value = workUnit;
    this.position.value = position;
    this.workPeriod.value = workPeriod;
  }
  
  bool isAnyFieldEmpty() {
    return name.value.isEmpty ||
        age.value.isEmpty ||
        gender.value.isEmpty ||
        education.value.isEmpty ||
        workUnit.value.isEmpty ||
        position.value.isEmpty ||
        workPeriod.value.isEmpty;
  }
}
