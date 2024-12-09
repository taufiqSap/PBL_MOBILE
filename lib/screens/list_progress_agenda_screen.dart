import 'package:flutter/material.dart';
import '../services/agenda_service.dart'; // Tambahkan layanan API
import '../widgets/agenda_card.dart';
import '../widgets/footer.dart';

class ListProgressAgenda extends StatefulWidget {
  const ListProgressAgenda({super.key});

  @override
  _ListProgressAgendaState createState() => _ListProgressAgendaState();
}

class _ListProgressAgendaState extends State<ListProgressAgenda> {
  final AgendaService _agendaService = AgendaService(baseUrl: 'http://192.168.1.8:8000/api');
  late Future<List<dynamic>> _agendas;
  final String _authToken = 'YOUR_AUTH_TOKEN'; // Ganti dengan token aktual

  @override
  void initState() {
    super.initState();
    _fetchAgendas(); // Memuat data awal
  }

  void _fetchAgendas() {
    setState(() {
      _agendas = _agendaService.getActiveAgendas(_authToken);
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
              // Navigasi ke halaman profil dosen
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
          // Tab selector
          Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    _fetchAgendas(); // Memuat ulang daftar agenda
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
                  onPressed: () {
                    // Navigasi ke riwayat agenda
                  },
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
              onChanged: (value) {
                // Tambahkan fitur pencarian jika diperlukan
              },
            ),
          ),

          // Daftar Agenda
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _agendas,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada agenda.'));
                }

                final agendas = snapshot.data!;
                return ListView.builder(
                  itemCount: agendas.length,
                  itemBuilder: (context, index) {
                    final agenda = agendas[index];
                    return AgendaCard(
                      title: agenda['nama_kegiatan'],
                      subtitle: agenda['deskripsi'],
                      progress: 100, // Atur progress sesuai data Anda
                      date: agenda['tanggal_mulai'],
                      fileName: agenda['file_surat'] ?? 'Tidak ada file',
                      status: 'Berlangsung',
                      statusColor: Colors.orange,
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
}
