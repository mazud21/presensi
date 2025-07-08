import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'model_presensi.dart';

class PresensiService {

  static const _baseUrl =
      'https://demoapi-alhikmah.watulintang.app/api/presensi/list';

  Future<List<ModelPresensi>> fetchPresensi() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) throw Exception('Token tidak tersedia. Silakan login ulang.');

    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> data = body['data'];
      return data.map((e) => ModelPresensi.fromJson(e)).toList();
    }

    // Jika gagal
    final body = jsonDecode(response.body);
    final msg = body['message'] ?? 'Gagal mengambil data';
    throw Exception(msg);
  }
}
