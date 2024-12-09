import 'package:flutter/material.dart';
import 'package:mobile_pbl/services/agenda_service.dart';
import '../widgets/footer.dart';

class RiwayatAgenda extends StatefulWidget {
  const RiwayatAgenda({super.key});

  @override
  State<RiwayatAgenda> createState() => _RiwayatAgendaState();
}

class _RiwayatAgendaState extends State<RiwayatAgenda> {
  final AgendaService _agendaService =
      AgendaService(baseUrl: 'http://192.168.1.114:8000/api/riwayat-agenda');
  late Future<List<dynamic>> _completedAgendas;
  final String _authToken = 'YOUR_AUTH_TOKEN'; // Ganti dengan token aktual

  @override
  void initState() {
    super.initState();
    _completedAgendas = _agendaService.getCompletedAgendas(_authToken);
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
              // Navigasi ke halaman profil
            },
            child: const Text('PROFILE', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // Navigasi ke halaman login
            },
            child: const Text('LOGOUT', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Daftar Progress Agenda',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 80),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Riwayat Agenda',
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
            child: FutureBuilder<List<dynamic>>(
              future: _completedAgendas,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada agenda selesai.'));
                }

                final agendas = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: agendas.length,
                  itemBuilder: (context, index) {
                    final agenda = agendas[index];
                    return buildKegiatanCard(
                      agenda['nama_kegiatan'],
                      agenda['tanggal_mulai'],
                      agenda['tanggal_selesai'],
                      agenda['pic'] ?? 'Tidak ada PIC',
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget buildKegiatanCard(
      String title, String startDate, String endDate, String pic) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 8),
              Text("Mulai: $startDate"),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 8),
              Text("Selesai: $endDate"),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.person, size: 16),
              const SizedBox(width: 8),
              Text("PIC: $pic"),
            ],
          ),
        ],
      ),
    );
  }
}
