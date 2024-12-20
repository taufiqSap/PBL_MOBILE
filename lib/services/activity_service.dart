import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ActivityService {
  static const String baseUrl = 'http://192.168.1.108:8000/api/v1/kaprodi/mobile/surat-tugas';

  Future<Map<String, dynamic>> getActivityList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return {
        'success': false,
        'message': 'Token tidak ditemukan. Silakan login kembali.'
      };
    }

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print('Request ke: $baseUrl');
        print('Response: ${response.body}');
        if (data['status'] == 'success') {
          return {
            'success': true,
            'message': data['message'] ?? '',
            'data': data['data']
          };
        } else {
          return {
            'success': false,
            'message': data['message']
          };
        }
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e'
      };
    }
  }

  Future<Map<String, dynamic>> getActivityStatistics(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return {
        'success': false,
        'message': 'Token tidak ditemukan. Silakan login kembali.'
      };
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id/statistik'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == 'success') {
          return {
            'success': true,
            'data': data['data']
          };
        } else {
          return {
            'success': false,
            'message': data['message'] ?? 'Gagal mengambil data statistik'
          };
        }
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}'
      };
    }
  }
}
