import 'package:flutter/material.dart';

class SuratTugas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('Surat Tugas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/dashboard'); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Card(
                color: Color(0xFFD9E6FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Upload Surat Tugas button pressed');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Upload action triggered!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD0021B),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        child: Text('Upload Surat Tugas',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          print('Download Surat Tugas button pressed');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Download action triggered!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3366CC),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        child: Text('Download Surat Tugas',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Color(0xFF3366CC),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('BLU POLITEKNIK NEGERI MALANG',
                        style: TextStyle(color: Colors.white)),
                    Text('Soekarno Hatta Street No.9 Malang 65141',
                        style: TextStyle(color: Colors.white)),
                    Text(
                        'Jatimulyo, Kec. Lowokwaru, Malang, East Java, Indonesia',
                        style: TextStyle(color: Colors.white)),
                    Text('PMND', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Text('Kontak', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.youtube_searched_for, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Copyright © 2024 Polinema. All rights reserved.',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
