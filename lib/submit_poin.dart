import 'package:flutter/material.dart';

class SubmitPoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('Submit & Poin'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard_dosen');
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Submit & Poin',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tenggat waktu:'),
                    Text(
                      '00:00:00',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Text('File Dokumen'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Choose File'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Replaces 'primary'
                            foregroundColor: Colors.red, // Replaces 'onPrimary'
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Ekstensi (.jpg, .jpeg, .png, .pdf)'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Upload'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Remove Submission'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                'Poin anda:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '10',
                style: TextStyle(fontSize: 48, color: Colors.red),
              ),
              Footer(), // Use the Footer widget here
            ],
          ),
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
