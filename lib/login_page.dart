import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk username dan password
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // API URL
  final String apiUrl = 'http://localhost/api/login.php';

  Future<void> login() async {
    try {
      // Kirim data login ke API
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      final responseData = json.decode(response.body);

      if (responseData['success']) {
        // Periksa level_id dari respons API
        String role = responseData['role'];

        if (role == 'kaprodi') {
          Navigator.pushReplacementNamed(context, '/dashboard_kaprodi');
        } else if (role == 'dosen') {
          Navigator.pushReplacementNamed(context, '/dashboard_dosen');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Peran tidak dikenali')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/id/4/4a/Logo_Politeknik_Negeri_Malang.png',
              height: 50,
            ),
            SizedBox(width: 20),
            Text(
              'Sistem Informasi Manajemen SDM',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Login',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: login,
                icon: Icon(Icons.arrow_right_alt),
                label: Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3366CC),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.network(
                'https://pbs.twimg.com/profile_images/1628751671420669952/WbdE8w2x_400x400.jpg',
                height: 25,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  'BLU POLITEKNIK NEGERI MALANG\n'
                  '- Soekarno Hatta Street No.9 Malang 65141\n'
                  'Jatimulyo, Kec. Lowokwaru, Malang,\n'
                  'East Java - Indonesia\n'
                  '- PMDN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Kontak',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.email, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.youtube_searched_for, color: Colors.white),
            ],
          ),
          SizedBox(height: 7),
          Text(
            'Copyright © 2024 Polinema. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
