import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDokumenService {
  final String baseUrl;
  final String token;

  ApiDokumenService({required this.baseUrl, required this.token});

  // GET: Ambil daftar agenda
  Future<List<dynamic>> getAgendaList() async {
    final url = Uri.parse('$baseUrl/get-agenda-list');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return data['data'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to load agenda list');
    }
  }

  // GET: Ambil dokumentasi berdasarkan ID
  Future<Map<String, dynamic>> getDokumentasi(int id) async {
    final url = Uri.parse('$baseUrl/get-dokumentasi/$id');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return data['data'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to load dokumentasi');
    }
  }

  // POST: Tambah dokumentasi
  Future<Map<String, dynamic>> addDokumentasi({
    required int agendaId,
    required String deskripsi,
    required String filePath,
  }) async {
    final url = Uri.parse('$baseUrl/store');
    final request = http.MultipartRequest('POST', url);

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['agenda_id'] = agendaId.toString();
    request.fields['deskripsi_dokumentasi'] = deskripsi;
    request.files.add(await http.MultipartFile.fromPath('file_dokumentasi', filePath));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = json.decode(responseBody);
      if (data['status'] == 'success') {
        return data['data'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to add dokumentasi');
    }
  }

  // PUT: Update dokumentasi
  Future<void> updateDokumentasi({
    required int id,
    required String deskripsi,
    String? filePath,
  }) async {
    final url = Uri.parse('$baseUrl/update/$id');
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['_method'] = 'PUT';
    request.fields['deskripsi_dokumentasi'] = deskripsi;

    if (filePath != null) {
      request.files.add(await http.MultipartFile.fromPath('file_dokumentasi', filePath));
    }

    final response = await request.send();
    if (response.statusCode != 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      throw Exception(data['message'] ?? 'Failed to update dokumentasi');
    }
  }

  // DELETE: Hapus dokumentasi
  Future<void> deleteDokumentasi(int id) async {
    final url = Uri.parse('$baseUrl/destroy/$id');
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      final data = json.decode(response.body);
      throw Exception(data['message'] ?? 'Failed to delete dokumentasi');
    }
  }
}
