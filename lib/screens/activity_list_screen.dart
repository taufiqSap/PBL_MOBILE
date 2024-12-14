import 'package:flutter/material.dart';
import 'package:mobile_pbl/screens/login_screen.dart';
import 'package:mobile_pbl/screens/profile_dosen_screen.dart';
import 'package:mobile_pbl/services/activity_service.dart';
import 'package:mobile_pbl/widgets/footer.dart';
import 'package:intl/intl.dart';

class ActivityListScreen extends StatefulWidget {
  const ActivityListScreen({super.key});

  @override
  State<ActivityListScreen> createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  final ActivityService _activityService = ActivityService();
  List<dynamic> _activities = [];
  bool _isLoading = true;
  String _error = '';
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _filteredActivities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    try {
      setState(() {
        _isLoading = true;
        _error = '';
      });

      final result = await _activityService.getActivityList();

      if (result['success']) {
        setState(() {
          _activities = result['data'];
          _filteredActivities = _activities;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = result['message'];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _filterActivities(String query) {
    setState(() {
      _filteredActivities = _activities.where((activity) {
        final kegiatan = activity['kegiatan'];
        if (kegiatan == null) return false;
        
        final namaKegiatan = kegiatan['nama_kegiatan']?.toString().toLowerCase() ?? '';
        final deskripsi = kegiatan['deskripsi_kegiatan']?.toString().toLowerCase() ?? '';
        final nomorSurat = activity['nomer_surat']?.toString().toLowerCase() ?? '';
        final judulSurat = activity['judul_surat']?.toString().toLowerCase() ?? '';
        
        return namaKegiatan.contains(query.toLowerCase()) ||
               deskripsi.contains(query.toLowerCase()) ||
               nomorSurat.contains(query.toLowerCase()) ||
               judulSurat.contains(query.toLowerCase());
      }).toList();
    });
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileDosenScreen()),
              );
            },
            child: const Text('PROFILE', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterActivities,
              decoration: InputDecoration(
                hintText: 'Cari Kegiatan',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // List of Activities
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error.isNotEmpty
                    ? Center(child: Text(_error))
                    : _filteredActivities.isEmpty
                        ? const Center(child: Text('Tidak ada kegiatan ditemukan'))
                        : ListView.builder(
                            itemCount: _filteredActivities.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            itemBuilder: (context, index) {
                              final activity = _filteredActivities[index];
                              final kegiatan = activity['kegiatan'];

                              return Card(
                                margin: const EdgeInsets.only(bottom: 16.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              activity['judul_surat'] ?? 'Tidak ada judul',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          if (kegiatan != null && kegiatan['status_kegiatan'] != null)
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: kegiatan['status_kegiatan'].toString().toLowerCase() == 'selesai'
                                                    ? Colors.green
                                                    : Colors.orange,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                kegiatan['status_kegiatan'].toString().toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'No. Surat: ${activity['nomer_surat'] ?? '-'}',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      if (activity['file_surat'] != null) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'File: ${activity['file_surat']}',
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                      if (activity['tanggal_surat'] != null) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'Tanggal Surat: ${DateFormat('dd MMMM yyyy').format(DateTime.parse(activity['tanggal_surat']))}',
                                          style: const TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                      if (kegiatan != null) ...[
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Detail Kegiatan:',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Nama: ${kegiatan['nama_kegiatan'] ?? '-'}'),
                                        Text('Lokasi: ${kegiatan['lokasi_kegiatan'] ?? '-'}'),
                                        Text('Penyelenggara: ${kegiatan['penyelenggara'] ?? '-'}'),
                                        if (kegiatan['tanggal_mulai'] != null && kegiatan['tanggal_selesai'] != null)
                                          Text(
                                            'Periode: ${DateFormat('dd MMM yyyy').format(DateTime.parse(kegiatan['tanggal_mulai']))} - ${DateFormat('dd MMM yyyy').format(DateTime.parse(kegiatan['tanggal_selesai']))}',
                                          ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
