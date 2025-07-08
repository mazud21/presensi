class ModelPresensi {
  final int id;
  final String date;       // yyyy‑MM‑dd
  final String status;     // hadir / izin / dll
  final String studentName;

  ModelPresensi({
    required this.id,
    required this.date,
    required this.status,
    required this.studentName,
  });

  factory ModelPresensi.fromJson(Map<String, dynamic> json) {
    return ModelPresensi(
      id: json['id'],
      date: json['date'],
      status: json['status'],
      studentName: json['student']['student_name'],
    );
  }
}
