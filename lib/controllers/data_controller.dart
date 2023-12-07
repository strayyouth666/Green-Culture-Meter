import 'package:get/get.dart';

class DataController extends GetxController {
  RxString name = ''.obs;
  RxString age = ''.obs;
  RxString gender = ''.obs;
  RxString nik = ''.obs;
  RxString position = ''.obs;
  RxString department = ''.obs;
  RxString compartment = ''.obs;

  void saveUserData({
    required String name,
    required String age,
    required String gender,
    required String nik,
    required String position,
    required String department,
    required String compartment,
  }) {
    this.name.value = name;
    this.age.value = age;
    this.gender.value = gender;
    this.nik.value = nik;
    this.position.value = position;
    this.department.value = department;
    this.compartment.value = compartment;
  }
  
  bool isAnyFieldEmpty() {
    return name.value.isEmpty ||
        age.value.isEmpty ||
        gender.value.isEmpty ||
        nik.value.isEmpty ||
        position.value.isEmpty ||
        department.value.isEmpty ||
        compartment.value.isEmpty;
  }
}
