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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    fillColor: Color(0xFF1C2341),
                    hintText: "Usia",
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
                    fillColor: Color(0xFF1C2341),
                    hintText: "Jenis Kelamin",
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
                    fillColor: Color(0xFF1C2341),
                    hintText: "NIK",
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
                    fillColor: Color(0xFF1C2341),
                    hintText: "Department",
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
                    fillColor: Color(0xFF1C2341),
                    hintText: "Kompartemen",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
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
