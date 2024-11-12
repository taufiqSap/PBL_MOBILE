import 'package:flutter/material.dart';
import 'package:flutter_application_1/dasboard.dart';
import 'package:flutter_application_1/dasboard_profile.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/dasboard.dart';
import 'package:flutter_application_1/dasboard_profile.dart';
import 'package:flutter_application_1/detail_kegiatan.dart';
import 'package:flutter_application_1/penilaian.dart';
import 'package:flutter_application_1/poin.dart';
import 'package:flutter_application_1/surat_tugas.dart';
import 'package:flutter_application_1/dashboard_dosen.dart';
import 'package:flutter_application_1/profile_dosen.dart';
import 'package:flutter_application_1/document.dart';
import 'package:flutter_application_1/jadwal_kegiatan.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/submit_poin.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login_page': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/profile': (context) => DasboardProfile(),
        '/detail': (context) => DetailKegiatan(),
        '/penilaian': (context) => Penilaian(),
        '/poin': (context) => Poin(),
        '/surat': (context) => SuratTugas(),
         '/dashboard_dosen': (context) => DasboardDosen(),
        '/profile_dosen': (context) => ProfileDosen(),
        '/document': (context) => Document(),
        '/history': (context) => History(),
        '/jadwal': (context) => JadwalKegiatan(),
        '/submit_poin': (context) => SubmitPoin(),
      },
    );
  }
}
