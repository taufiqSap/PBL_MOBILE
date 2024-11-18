import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileKaprodi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pimpinan Prodi'),
        backgroundColor: Color(0xFF3b73e9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Profil Pimpinan Prodi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Color(0xFF3b73e9), width: 5),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Profil dan Dokumen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pimpinan Kaprodi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ProfileInfo(
                    title: 'Nama',
                    value: 'Lorem ipsum dolor sit amet',
                  ),
                  ProfileInfo(
                    title: 'Telepon',
                    value: 'Lorem ipsum dolor sit amet',
                  ),
                  ProfileInfo(
                    title: 'Unit Kerja',
                    value: 'Lorem ipsum dolor sit amet',
                  ),
                  ProfileInfo(
                    title: 'Alamat Unit Kerja',
                    value: 'Lorem ipsum dolor sit amet',
                  ),
                  ProfileInfo(
                    title: 'Pendidikan',
                    value: 'Lorem ipsum dolor sit amet',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(), 
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  ProfileInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3366CC),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.network(
                'https://pbs.twimg.com/profile_images/1628751671420669952/WbdE8w2x_400x400.jpg',
                height: 25,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  'BLU POLITEKNIK NEGERI MALANG\n'
                  '- Soekarno Hatta Street No.9 Malang 65141\n'
                  'Jatimulyo, Kec. Lowokwaru, Malang,\n'
                  'East Java - Indonesia\n'
                  '- PMDN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
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
          SizedBox(height: 7),
          Text(
            'Copyright © 2024 Polinema. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
