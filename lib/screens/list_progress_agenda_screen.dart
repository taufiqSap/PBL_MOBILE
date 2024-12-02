import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/api_progress_kegiatan_service.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/widgets/agenda_card.dart';
import 'package:flutter_application_4/widgets/footer.dart';

class ListProgressAgenda extends StatefulWidget {
  final String token; // Token for authentication

  const ListProgressAgenda({super.key, required this.token});

  @override
  State<ListProgressAgenda> createState() => _ListProgressAgendaState();
}

class _ListProgressAgendaState extends State<ListProgressAgenda> {
  late ProgressKegiatanService progressKegiatanService; // Service instance
  List<dynamic> _progressList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    progressKegiatanService = ProgressKegiatanService(widget.token); // Initialize service with token
    _loadProgressData(); // Load progress data
  }

  Future<void> _loadProgressData() async {
    try {
      final progressData = await progressKegiatanService.fetchProgress(); // Correct service call
      setState(() {
        _progressList = progressData; // Update progress list
        _isLoading = false; // Set loading to false
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Set loading to false on error
      });
      print("Error fetching progress data: $e");
      // Optionally, show an error message to the user
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
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
                    'Daftar Progress Agenda',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Progress',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // List of Agenda Cards
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _progressList.length,
                    itemBuilder: (context, index) {
                      final item = _progressList[index];
                      return AgendaCard(
                        title: item['nama_kegiatan'],
                        subtitle: item['jenis_kegiatan'],
                        progress: item['progress_percentage'],
                        date: "${item['tanggal_mulai']} - ${item['tanggal_selesai']}",
                        fileName: '',
                        status: item['progress_percentage'] == 100 ? 'Selesai' : 'Sedang Berlangsung',
                        statusColor: item['progress_percentage'] == 100 ? Colors.green : Colors.orange,
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