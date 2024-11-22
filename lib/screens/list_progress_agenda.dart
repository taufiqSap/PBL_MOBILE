import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/screens/update_progress.dart';
import 'package:flutter_application_4/widgets/agenda_card.dart';
import 'package:flutter_application_4/widgets/footer.dart';

class ProgressListPage extends StatelessWidget {
  const ProgressListPage({super.key});

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
                MaterialPageRoute(
                    builder: (context) => const ProfileDosenScreen()),
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
      body: Column(
        children: [
          // Tab selector
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProgressPage()),
                    );
                  },
                  child: const Text(
                    'Form Update',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Daftar Progress',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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
            child: ListView(
              children: const [
                AgendaCard(
                  title: 'Seminar Akademik',
                  subtitle: 'Basic Programmer',
                  progress: 100,
                  date: '20/4/2024',
                  fileName: 'DOC-001.pdf',
                  status: 'Selesai',
                  statusColor: Colors.green,
                ),
                AgendaCard(
                  title: 'Workshop Flutter',
                  subtitle: 'Basic Flutter UI',
                  progress: 50,
                  date: '21/4/2024',
                  fileName: 'DWSC-002.pdf',
                  status: 'Sedang Berlangsung',
                  statusColor: Colors.orange,
                ),
                AgendaCard(
                  title: 'Seminar Akademik',
                  subtitle: 'Basic Programmer',
                  progress: 100,
                  date: '20/4/2024',
                  fileName: 'DOC-001.pdf',
                  status: 'Selesai',
                  statusColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
