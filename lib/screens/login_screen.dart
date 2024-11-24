import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/dashboard_dosen_screen.dart';
import 'package:flutter_application_4/widgets/footer_login.dart';

class LoginScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Level',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'dosen',
                    child: Text('Dosen'),
                  ),
                  DropdownMenuItem(
                    value: 'kaprodi',
                    child: Text('Kaprodi'),
                  ),
                ],
                onChanged: (value) {
                  // Handle change level
                },
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDosenScreen()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('LOGIN'),
                    SizedBox(width: 5),
                    Icon(Icons.login),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterLogin(),
    );
  }
}
