import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:file_picker/file_picker.dart';

class UploadFile extends StatelessWidget {
  final Function(String?, Uint8List?) onFileSelected;

  const UploadFile({super.key, required this.onFileSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            if (kIsWeb) {
              // Platform web
              Uint8List? fileBytes = result.files.single.bytes;
              String fileName = result.files.single.name;
              onFileSelected(fileName, fileBytes);
            } else {
              // Platform non-web
              String? filePath = result.files.single.path;
              onFileSelected(filePath, null);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tidak ada file yang dipilih')),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Terjadi error: $e')),
          );
        }
      },
      child: const Text('Pilih File'),
    );
  }
}
