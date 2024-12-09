import 'dart:convert';
import 'dart:typed_data'; // Untuk Uint8List
import 'package:flutter/material.dart';
import 'package:mobile_pbl/widgets/footer.dart';
import '../widgets/upload_file.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart'; // Untuk kIsWeb
import 'package:http/http.dart' as http;
import '../screens/list_progress_agenda_screen.dart';
import '../services/api_update_progress.dart';

class UpdateProgressPage extends StatefulWidget {
  const UpdateProgressPage({super.key});

  @override
  State<UpdateProgressPage> createState() => _UpdateProgressPageState();
}

class _UpdateProgressPageState extends State<UpdateProgressPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedKegiatan;
  String? _selectedAgenda;
  String? _deskripsi;
  String? _filePath;
  Uint8List? _fileBytes; // File data for web
  bool _isLoading = false;

  Future<void> _submitProgress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String? fileBase64;

      if (!kIsWeb && _filePath != null) {
        final fileBytes = await File(_filePath!).readAsBytes();
        fileBase64 = base64Encode(fileBytes);
      } else if (kIsWeb && _fileBytes != null) {
        fileBase64 = base64Encode(_fileBytes!);
      } else {
        throw Exception("Tidak ada file yang dipilih.");
      }

      final response = await http.post(
        Uri.parse('http://192.168.1.8:8000/api/update-progress'),
        headers: {
          'Authorization': 'Bearer YOUR_AUTH_TOKEN',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nama_dokumentasi': _selectedKegiatan ?? "Nama Kegiatan",
          'deskripsi_dokumentasi': _deskripsi ?? "Deskripsi Agenda",
          'tanggal': '2023-12-01',
          'fileBytes': fileBase64,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Progress berhasil diupdate')),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ListProgressAgenda()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal update progress: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
              // Navigasi ke halaman Profile
            },
            child: const Text('PROFILE', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // Navigasi ke halaman Login
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Update Progress Agenda',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Silahkan Lengkapi Form Berikut',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      const Text('Kegiatan'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: ['Kegiatan 1', 'Kegiatan 2', 'Kegiatan 3']
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) => _selectedKegiatan = value,
                        validator: (value) =>
                            value == null ? 'Kegiatan harus dipilih' : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 197, 197),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Pilih Agenda'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        items: ['Agenda 1', 'Agenda 2', 'Agenda 3']
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (value) => _selectedAgenda = value,
                        validator: (value) =>
                            value == null ? 'Agenda harus dipilih' : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 197, 197),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Deskripsi'),
                      const SizedBox(height: 8),
                      TextFormField(
                        onChanged: (value) => _deskripsi = value,
                        maxLines: 3,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Deskripsi harus diisi'
                            : null,
                        decoration: const InputDecoration(
                          hintText: 'Tuliskan deskripsi kegiatan',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 197, 197, 197),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Upload Berkas'),
                      const SizedBox(height: 8),
                      UploadFile(
                        onFileSelected: (filePath, fileBytes) {
                          setState(() {
                            if (filePath != null) {
                              _filePath = filePath;
                              _fileBytes = null;
                            } else if (fileBytes != null) {
                              _fileBytes = fileBytes;
                              _filePath = null;
                            }
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('File berhasil dipilih')),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () {
                                  if ((_filePath != null && !kIsWeb) ||
                                      (_fileBytes != null && kIsWeb)) {
                                    _submitProgress();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('File harus dipilih')),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Simpan Progress',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
