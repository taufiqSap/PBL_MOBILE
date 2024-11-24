import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/agenda_nonjti.dart';
import 'package:flutter_application_4/screens/dashboard_dosen_screen.dart';
import 'package:flutter_application_4/screens/edit_profile_dosen_screen.dart';
import 'package:flutter_application_4/screens/list_progress_agenda.dart';
import 'package:flutter_application_4/screens/login_screen.dart';
import 'package:flutter_application_4/screens/profile_dosen_screen.dart';
import 'package:flutter_application_4/screens/riwayat_nonjti.dart';
import 'package:flutter_application_4/screens/update_progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Informasi Manajemen SDM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/dashboard_dosen': (context) => DashboardDosenScreen(),
        '/edit_profile_dosen': (context) => EditProfileDosenScreen(),
        '/login': (context) => LoginScreen(),
        '/profile_dosen': (context) => ProfileDosenScreen(),
        '/agenda': (context) => ProgressListPage(),
        '/update': (context) => UpdateProgressPage(),
        '/nonjti_agenda': (context) => AgendaNonjti(),
        '/riwatar': (context) => RiwayatScreen(),
      },
    );
  }
}
