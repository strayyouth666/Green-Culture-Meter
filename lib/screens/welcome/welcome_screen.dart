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
  final TextEditingController nikController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController compartmentController = TextEditingController();

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E7F1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text.rich(
                  TextSpan(
                    text: "  Let's Play Quiz ",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Green Culture Meter',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '  Enter your information below',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF15296F),
                    hintText: "Nama",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<int>(
                  value: ageController.text.isNotEmpty
                      ? int.tryParse(ageController.text)
                      : null,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      ageController.text = newValue.toString();
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF15296F),
                    hintText: "Usia",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  items: ages.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: genderController.text.isNotEmpty
                      ? genderController.text
                      : null,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      genderController.text = newValue;
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF15296F),
                    hintText: "Jenis Kelamin",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  items: <String>['Laki-Laki', 'Perempuan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nikController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF15296F),
                    hintText: "NIK",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
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
                    fillColor: Color(0xFF15296F),
                    hintText: "Jabatan",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: departmentController.text.isNotEmpty
                      ? departmentController.text
                      : null,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      departmentController.text = newValue;
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF15296F),
                    hintText: "Department",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  items:
                      departments.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SizedBox(
                        width: 200,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: compartmentController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                    ),
                    fillColor: Color(0xFF15296F),
                    hintText: "Kompartemen",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _dataController.saveUserData(
                      name: nameController.text,
                      age: ageController.text,
                      gender: genderController.text,
                      nik: nikController.text,
                      department: departmentController.text,
                      position: positionController.text,
                      compartment: compartmentController.text,
                    );
                    if (_dataController.isAnyFieldEmpty()) {
                      Get.defaultDialog(
                        title: "Data tidak lengkap",
                        middleText: "Pastikan semua data terisi.",
                        textConfirm: "OK",
                        onConfirm: () {
                          Get.back();
                        },
                      );
                    } else {
                      Get.to(const QuizScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFADC7AE),
                          Color(0xFF6F905A),
                          Color(0x6FF16F1F),
                        ],
                        stops: [0.0, 0.999, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 60,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Let's Start Quiz",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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

List<String> departments = [
  'Audit Keuangan & Umum',
  'Audit Operasi & Produksi',
  'Hukum',
  'Administrasi Bisnis',
  'Komunikasi Korporat',
  'TKP & Manajemen Risiko',
  'Project Agrosolution',
  'Project Retail Management',
  'Akuntansi Biaya',
  'Keuangan',
  'Pelaporan Keuangan & Manajemen',
  'Anggaran',
  'Portofolio Bisnis',
  'Corporate Social Responsibility',
  'Keamanan',
  'Pelayanan Umum',
  'Inovasi & Sistem Manajemen',
  'Pengembangan SDM & Organisasi',
  'Remunerasi & Hubungan Industrial',
  'Pengadaan Barang',
  'Pengadaan Jasa',
  'Perencanaan & Penerimaan Barang/Jasa',
  'Produksi I A',
  'Produksi I B',
  'Produksi II A',
  'Produksi II B',
  'Produksi III A',
  'Produksi III B',
  'Administrasi & Penjualan',
  'Administrasi Pemasaran',
  'Pengelolaan Mitra Produksi',
  'Inspeksi Teknik Rotating',
  'Inspeksi Teknik Statik',
  'Perencanaan & Pengendalian TA',
  'Perencanaan Strategi Pemeliharaan',
  'Reliability',
  'Bengkel & Fabrikasi',
  'Pemeliharaan I',
  'Pemeliharaan II',
  'Pemeliharaan III',
  'Teknik & Bisnis',
  'Keselamatan & Kesehatan Kerja',
  'Lingkungan',
  'Perencanaan Produksi & Pengelolaan Energi',
  'Proses & Pengendalian Kualitas',
  'Pengembangan Korporat',
  'Rancang Bangun',
  'Riset',
  'Pengelolaan Pelabuhan',
  'Pergudangan',
];

List<int> ages = List.generate(53, (index) => index + 18);
