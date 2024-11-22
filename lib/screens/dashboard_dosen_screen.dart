import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/widgets/footer.dart';
import 'package:flutter_application_4/widgets/dashboard_dosen_card.dart';

class DashboardDosenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileDosenScreen()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'PROFILE',
              style: TextStyle(color: Colors.white), 
            ),
          ),
          const SizedBox(width: 10), 
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'LOGOUT',
              style: TextStyle(color: Colors.white), 
            ),
          ),
          const SizedBox(width: 10), 
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat datang, [nama lengkap user]',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DashboardCard(title: 'Total Kegiatan', count: '[jumlah]'),
                  DashboardCard(title: 'Kegiatan Selesai', count: '[jumlah]'),
                  DashboardCard(title: 'Kegiatan Berjalan', count: '[jumlah]'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.brown,
                      child: const Text('Foto'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '[nama lengkap]',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('NIDN: [nomer NIDN]'),
                        Text('Program Studi: [nama program studi]'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[nama kegiatan]',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('[nama Agenda]'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('[tanggal agenda]'),
                          Text('Agenda [${index + 1}/5]'),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

