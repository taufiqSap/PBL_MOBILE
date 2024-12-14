import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/activity_model.dart';

class ActivityService {
  static const String baseUrl = 'http://192.168.1.110:8000/api/v1/kaprodi/mobile/surat-tugas';

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
        
        if (data['status'] == 'success') {
          final List<ActivityModel> suratTugas = (data['data'] as List)
              .map((item) => ActivityModel.fromJson(item))
              .toList();

          return {
            'success': true,
            'message': data['message'],
            'data': suratTugas
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
}
