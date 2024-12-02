import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/api_dokumen_service.dart';

class DownloadDocumentsScreen extends StatefulWidget {
  final String token;

  const DownloadDocumentsScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<DownloadDocumentsScreen> createState() => _DownloadDocumentsScreenState();
}

class _DownloadDocumentsScreenState extends State<DownloadDocumentsScreen> {
  late ApiDokumenService apiDokumenService;
  List<dynamic> agendaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    apiDokumenService = ApiDokumenService(
      baseUrl: 'http://your-laravel-server.com/api',
      token: widget.token,
    );
    loadAgenda();
  }

  Future<void> loadAgenda() async {
    try {
      final data = await apiDokumenService.getAgendaList();
      setState(() {
        agendaList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error loading agenda: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download Dokumen')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: agendaList.length,
              itemBuilder: (context, index) {
                final agenda = agendaList[index];
                return ListTile(
                  title: Text(agenda['nama_agenda']),
                  subtitle: Text("Tanggal: ${agenda['tanggal_agenda']}"),
                  trailing: agenda['has_dokumentasi']
                      ? ElevatedButton(
                          onPressed: () {
                            // Logika unduh dokumen
                          },
                          child: const Text('Unduh'),
                        )
                      : const Text('Belum Ada Dokumentasi'),
                );
              },
            ),
    );
  }
}
