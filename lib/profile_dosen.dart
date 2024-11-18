import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileDosen extends StatefulWidget {
  @override
  _ProfileDosenState createState() => _ProfileDosenState();
  Future<Map<String, dynamic>?> dosenData(int id) async {
  final String apiUrl = 'http://localhost/api/dosenData.php?id$id'; 

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body); 
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching data: $error');
    return null;
  }
}

}

class _ProfileDosenState extends State<ProfileDosen> {
  Map<String, dynamic>? dosenData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  final data = await dosenData(1); 
  setState(() {
    dosenData = data;
    isLoading = false;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard_dosen');
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : dosenData == null
              ? Center(child: Text('Data not found'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 100,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileDetail(
                                  label: 'Nama',
                                  value: dosenData?['nama_lengkap'] ?? 'N/A'),
                              ProfileDetail(
                                  label: 'NIDN',
                                  value: dosenData?['nidn'] ?? 'N/A'),
                              ProfileDetail(
                                  label: 'Tanggal Lahir',
                                  value: dosenData?['tanggal_lahir'] ?? 'N/A'),
                              ProfileDetail(
                                  label: 'Alamat',
                                  value: dosenData?['alamat'] ?? 'N/A'),
                              ProfileDetail(
                                  label: 'Email',
                                  value: dosenData?['email'] ?? 'N/A'),
                              ProfileDetail(
                                  label: 'No Telp',
                                  value: dosenData?['no_telp'] ?? 'N/A'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Footer(),
                      ],
                    ),
                  ),
                ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  ProfileDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(value),
          ),
        ],
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
