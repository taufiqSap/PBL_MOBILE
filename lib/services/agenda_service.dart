import 'dart:convert';
import 'package:http/http.dart' as http;

class AgendaService {
  final String baseUrl;

  AgendaService({required this.baseUrl});

  // Mendapatkan daftar agenda aktif
  Future<List<dynamic>> getActiveAgendas(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/agendas/active'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Gagal mendapatkan daftar agenda aktif: ${response.body}');
    }
  }

  // Mendapatkan daftar agenda selesai
  Future<List<dynamic>> getCompletedAgendas(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/agendas/completed'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Gagal mendapatkan daftar agenda selesai: ${response.body}');
    }
  }

  // Mengupdate status agenda
  Future<void> updateAgendaStatus(String id, String status, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/agendas/$id/update-status'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'status_agenda': status,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengupdate status agenda: ${response.body}');
    }
  }
}
