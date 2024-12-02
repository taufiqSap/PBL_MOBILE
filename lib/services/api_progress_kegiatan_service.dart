import 'dart:convert';
import 'package:http/http.dart' as http;

class ProgressKegiatanService {
  static const String baseUrl = "http://your-laravel-server.com/api";

  final String token;

  ProgressKegiatanService(this.token);

  Future<List<dynamic>> fetchProgress() async {
    final response = await http.get(
      Uri.parse('$baseUrl/progress-kegiatan'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception("Failed to fetch progress data");
    }
  }
}
