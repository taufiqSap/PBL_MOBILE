import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/widgets/footer.dart';
import 'package:flutter_application_4/widgets/progress_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _MainPageState();
}

class _MainPageState extends State<ProgressScreen> {
  int _currentTab = 0;

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
                MaterialPageRoute(builder: (context) => ProfileDosenScreen()),
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
          // Selector tab
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentTab = 0;
                    });
                  },
                  child: Text(
                    'Agenda',
                    style: TextStyle(
                      color: _currentTab == 0 ? Colors.black : Colors.grey,
                      fontWeight: _currentTab == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentTab = 1;
                    });
                  },
                  child: Text(
                    'Progress',
                    style: TextStyle(
                      color: _currentTab == 1 ? Colors.black : Colors.grey,
                      fontWeight: _currentTab == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Konten tab
          Expanded(
            child: _currentTab == 0
                ? const Center(
                    child:
                        Text('Agenda Content')) // Placeholder untuk tab Agenda
                : const ProgressTab(), // Komponen untuk tab Progress
          ),
        ],
      ),
      bottomNavigationBar: const Footer(), // Widget Footer
    );
  }
}

class ProgressTab extends StatelessWidget {
  const ProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ProgressCard(
            title: 'Seminar Akademik', progress: 100, status: 'Selesai'),
        SizedBox(height: 16),
        ProgressCard(
            title: 'Workshop Kurikulum',
            progress: 50,
            status: 'Sedang Berlangsung'),
        SizedBox(height: 16),
        ProgressCard(
            title: 'Seminar Akademik',
            progress: 75,
            status: 'Sedang Berlangsung'),
      ],
    );
  }
}
