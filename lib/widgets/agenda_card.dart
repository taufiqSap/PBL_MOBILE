import 'package:flutter/material.dart';

class AgendaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int progress;
  final String date;
  final String fileName;
  final String status;
  final Color statusColor;

  const AgendaCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.date,
    this.fileName = '',
    required this.status,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress / 100,
              color: statusColor,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 8),
            Text("Tanggal: $date"),
            const SizedBox(height: 8),
            fileName.isNotEmpty ? Text("File: $fileName") : Container(),
            const SizedBox(height: 8),
            Text(
              "Status: $status",
              style: TextStyle(color: statusColor),
            ),
          ],
        ),
      ),
    );
  }
}
