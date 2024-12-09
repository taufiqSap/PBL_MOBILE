import 'package:flutter/material.dart';
import 'package:mobile_pbl/services/profile_service.dart';
import 'package:mobile_pbl/widgets/footer.dart';

class EditProfileDosenScreen extends StatefulWidget {
  const EditProfileDosenScreen({super.key});

  @override
  State<EditProfileDosenScreen> createState() => _EditProfileDosenScreenState();
}

class _EditProfileDosenScreenState extends State<EditProfileDosenScreen> {
  final ProfileService _profileService =
      ProfileService(baseUrl: 'http://192.168.1.114:8000/api/v1/profile/update');
  final String _authToken = 'YOUR_AUTH_TOKEN'; 
  final Map<String, String> _formData = {};
  bool _isLoading = false;

  Future<void> _fetchProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _profileService.getProfile(_authToken);
      setState(() {
        _formData.addAll(response['data'].cast<String, String>());
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching profile: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response =
          await _profileService.updateProfile(_authToken, _formData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'])),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Widget _buildFormField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: _formData[key],
            onChanged: (value) {
              _formData[key] = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: _updateProfile,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('SIMPAN'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildFormField('Username', 'username'),
              _buildFormField('Nama Lengkap', 'nama_lengkap'),
              _buildFormField('Email', 'email'),
              _buildFormField('Jabatan Fungsional', 'jabatan_fungsional'),
              _buildFormField('Program Studi', 'program_studi'),
              _buildFormField('Alamat', 'alamat'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
