import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {
  final String baseUrl;
  
  ProfileService({required this.baseUrl});

  Future<Map<String, dynamic>> getProfile(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch profile: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      String authToken, Map<String, String> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/profile/update'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update profile: ${response.body}');
    }
  }
}
