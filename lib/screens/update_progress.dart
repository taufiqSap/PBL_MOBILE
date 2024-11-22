import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/list_progress_agenda.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/widgets/footer.dart';
import 'package:flutter_application_4/widgets/upload_file.dart';

class UpdateProgressPage extends StatelessWidget {
  const UpdateProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'POLINEMA',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> ProfileDosenScreen()),
              );
            },
            child: const Text('PROFILE', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> LoginScreen()),
              );
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab selector
            Container(
              color: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Form Update',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> ProgressListPage())
                      );
                    },
                    child: const Text(
                      'Daftar Progress',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Form section
            const Text(
              'Update Progress Agenda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Silahkan Lengkapi Form Berikut',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Dropdown for Kegiatan
            const Text('Kegiatan'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: ['Kegiatan 1', 'Kegiatan 2', 'Kegiatan 3']
                  .map((String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 197, 197, 197),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown for Agenda
            const Text('Pilih Agenda'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: ['Agenda 1', 'Agenda 2', 'Agenda 3']
                  .map((String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 197, 197, 197),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown for Progress
            const Text('Progress (%)'),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              items: [0, 25, 50, 75, 100]
                  .map((int value) => DropdownMenuItem(
                        value: value,
                        child: Text('$value'),
                      ))
                  .toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 197, 197, 197),
              ),
            ),
            const SizedBox(height: 16),

            // File upload
            const Text('Upload Berkas'),
            const SizedBox(height: 8),
            const UploadFile(),
            const SizedBox(height: 16),

            // Simpan Progress Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Text(
                  'Simpan Progress',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
