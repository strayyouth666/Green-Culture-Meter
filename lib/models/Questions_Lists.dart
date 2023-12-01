class Question {
  final String part;
  final int id;
  final String question;
  final List<String> options;
  final List<int> pointValue;
  List<int> selectedOptions; // List to store selected options

  Question({
    required this.part,
    required this.id,
    required this.question,
    required this.options,
    required this.pointValue,
    required int answer,
  }) : selectedOptions = List<int>.filled(
            options.length, 0); // Initialize selectedOptions with 0
}

const List sample_data = [
  {
    "part": "Employee Green Behaviour",
    "id": 1,
    "question":
        "Sesuai dengan program ramah lingkungan yang diterapkan oleh PKG, saya mematikan lampu dan AC jika ruangan tidak dipakai atau sudah selesai dipakai.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Green Behaviour",
    "id": 2,
    "question":
        "Sesuai dengan program ramah lingkungan yang diterapkan oleh PKG, dalam keseharian saya memisahkan antara sampah organik dan sampah anorganik.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Green Behaviour",
    "id": 3,
    "question":
        "Saya berbagi pengetahuan mengenai masalah lingkungan dan cara penanggulangannya kepada rekan kerja saya di Unit Kerja.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Green Behaviour",
    "id": 4,
    "question":
        "Saya mengambil kesempatan untuk terlibat aktif dalam upaya menjaga lingkungan di Unit Kerja saya/ PKG secara umum",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Green Behaviour",
    "id": 5,
    "question":
        "Saya memberikan saran dan ide baru terkait praktik ramah lingkungan di Unit Kerja/PKG secara umum seperti penggunaan kertas bekas, penggunaan tumbler, dll",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Coorporate Social Responsibility",
    "id": 6,
    "question":
        "Perusahaan kami bertanggung jawab terhadap lingkungan dalam aktivitas operasionalnya.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Coorporate Social Responsibility",
    "id": 7,
    "question":
        "Perusahaan kami menerapkan program khusus untuk meminimalkan dampaknya terhadap lingkungan alam.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Coorporate Social Responsibility",
    "id": 8,
    "question":
        "Perusahaan kami berpartisipasi dalam kegiatan yang bertujuan untuk melindungi dan meningkatkan kualitas lingkungan alam.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Coorporate Social Responsibility",
    "id": 9,
    "question":
        "Perusahaan kami memiliki fasilitas yang diperlukan untuk mengurangi dampak negatif terhadap lingkungan sekitar",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Coorporate Social Responsibility",
    "id": 10,
    "question":
        "Perusahaan kami melakukan investasi yang terencana dengan baik untuk menghindari degradasi lingkungan sekitar.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 11,
    "question": "Saya mengetahui banyak tentang produk dan sampah daur ulang.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 12,
    "question": "Saya memahami istilah dan simbol terkait lingkungan.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 13,
    "question":
        "Saya mengetahui bagaimana memilih produk yang dapat mengurangi jumlah sampah.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 14,
    "question":
        "Menggunakan produk ramah lingkungan adalah salah satu langkah saya untuk mengurangi polusi.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 15,
    "question":
        "Saya mengetahui masalah lingkungan yang disebabkan oleh Perusahaan.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Environmental Knowledge",
    "id": 16,
    "question":
        "Saya mengetahui cara-cara yang dapat dilakukan untuk menjaga lingkungan sekitar/meminimalisir dampak dari kerusakan yang disebabkan oleh Perusahaan.",
    "options": [
      'Sangat Setuju',
      'Setuju',
      'Abstain/Ragu-ragu',
      'Tidak Setuju',
      'Sangat Tidak Setuju'
    ],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Ethical Leadership",
    "id": 17,
    "question":
        "Pimpinan Unit Kerja hingga Pimpinan puncak mendisiplinkan karyawan yang melanggar standar dan kode etik.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Ethical Leadership",
    "id": 18,
    "question":
        "Pimpinan Unit Kerja hingga Pimpinan puncak menjalani kehidupan dan aktivitas dalam lingkungan kerja dengan berpegang teguh pada norma dan etika yang disepakati bersama.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Ethical Leadership",
    "id": 19,
    "question":
        "Pimpinan Unit Kerja hingga Pimpinan puncak membahas etika dan atau nilai bisnis Perusahaan dengan karyawan.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Ethical Leadership",
    "id": 20,
    "question":
        "Pimpinan memberikan contoh bagaimana melakukan sesuatu dengan benar  sesuai dengan norma dan etika yang berlaku dan disepakati bersama.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Wellbeing",
    "id": 21,
    "question":
        "Saya merasa cukup puas dengan tanggung jawab dan pekerjaan saya saat ini.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Wellbeing",
    "id": 22,
    "question": "Lingkungan kerja saya sangat kondusif.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
  {
    "part": "Employee Wellbeing",
    "id": 23,
    "question":
        "Saya selalu dapat menemukan cara untuk meningkatkan kualitas pekerjaan saya dan membuat pekerjaan saya menjadi semakin baik.",
    "options": ['Selalu', 'Sering', 'Kadang-kadang', 'Pernah', 'Tidak Pernah'],
    "point_value": [5, 4, 3, 2, 1],
  },
];
