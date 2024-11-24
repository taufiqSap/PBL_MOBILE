import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiLogin {
  static const String baseUrl = 'http://192.168.1.100:8000/api'; 

  Future<Map<String, dynamic>> login(String username, String password, String levelId) async {
    final url = Uri.parse('$baseUrl/login'); 

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'level_id': levelId,
        }),
      );

      // Periksa respons server
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success']) {
          return {
            'success': true,
            'token': data['token'],
            'user': data['user'],
          };
        } else {
          return {'success': false, 'message': data['message'] ?? 'Login gagal'};
        }
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Error: Tidak dapat terhubung ke server ($e)'};
    }
  }
}
