import 'package:flutter/material.dart';class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('History'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              EventCard(
                title: 'DDM',
                date: '22-09-2023',
                description: 'Lorem Ipsum dolor sit amet, consectetur',
              ),
              EventCard(
                title: 'Dies Natalis',
                date: '10-12-2023',
                description: 'Lorem Ipsum dolor sit amet, consectetur',
              ),
              EventCard(
                title: 'Seminar Kurikulum',
                date: '01-07-2023',
                description: 'Lorem Ipsum dolor sit amet, consectetur',
              ),
              SizedBox(height: 20),
              Pagination(),
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
      color: Color(0xFFE0E0E0),
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
            SizedBox(height: 5),
            Text(date),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class Pagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaginationButton(
          text: '1',
          isActive: true,
        ),
        PaginationButton(
          text: '2',
        ),
        PaginationButton(
          text: '3',
        ),
        PaginationButton(
          text: '>',
        ),
      ],
    );
  }
}

class PaginationButton extends StatelessWidget {
  final String text;
  final bool isActive;

  PaginationButton({required this.text, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFFF4D4D) : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
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