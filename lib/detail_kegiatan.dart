import 'package:flutter/material.dart';

class DetailKegiatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('Evaluasi Kinerja'),
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
              // Header for the detail
              Text(
                'Evaluasi Detail Kegiatan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Workshop',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Done',
                            style: TextStyle(
                              color: Color(0xFF3366CC),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Nama Ketua Pelaksana kegiatan'),
                      SizedBox(height: 20),
                      Text(
                        'Deskripsi Kegiatan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.people),
                              SizedBox(width: 10),
                              Text('Anggota'),
                            ],
                          ),
                          Text('5 orang'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 10),
                              Text('Jadwal Pelaksanaan'),
                            ],
                          ),
                          Text('Juni 5, 2023'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Ketua Pelaksana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage:
                            NetworkImage('https://placehold.co/100x100'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Anggota Pelaksana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundImage:
                                  NetworkImage('https://placehold.co/50x50'),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Color(0xFF3366CC),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'BLU POLITEKNIK NEGERI MALANG',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Soekarno Hatta Street No.9 Malang 65141',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Jatimulyo, Kec. Lowokwaru, Malang, East Java, Indonesia',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'PMND',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kontak',
                      style: TextStyle(color: Colors.white),
                    ),
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
                    Text(
                      'Copyright © 2024 Polinema. All rights reserved.',
                      style: TextStyle(color: Colors.white),
                    ),
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
