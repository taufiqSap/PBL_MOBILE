import 'package:flutter/material.dart';
class JadwalKegiatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('Jadwal Kegiatan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/dashboard_dosen'); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jadwal dan Kegiatan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              EventCard(
                title: 'DDM',
                date: '22-09-2024',
                description: 'Lorem ipsum dolor sit amet, consectetur',
              ),
              EventCard(
                title: 'Dies Natalis',
                date: '10-12-2024',
                description: 'Lorem ipsum dolor sit amet, consectetur',
              ),
              EventCard(
                title: 'Seminar Kurikulum',
                date: '01-07-2024',
                description: 'Lorem ipsum dolor sit amet, consectetur',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  EventCard({required this.title, required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(date),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
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