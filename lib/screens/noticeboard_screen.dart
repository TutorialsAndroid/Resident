import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoticeBoardPage(),
    );
  }
}

class NoticeBoardPage extends StatelessWidget {
  final List<Notice> notices = [
    Notice(
      title: 'Maintenance Notice',
      description: 'The building will undergo maintenance on 1st August from 9 AM to 5 PM.',
      date: 'July 28, 2024',
    ),
    Notice(
      title: 'Community Event',
      description: 'Join us for a community event on 3rd August at the central park.',
      date: 'July 27, 2024',
    ),
    Notice(
      title: 'New Amenities',
      description: 'We are excited to announce new amenities coming soon to our complex.',
      date: 'July 26, 2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Board'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notices.length,
          itemBuilder: (context, index) {
            return NoticeCard(notice: notices[index]);
          },
        ),
      ),
    );
  }
}

class Notice {
  final String title;
  final String description;
  final String date;

  Notice({required this.title, required this.description, required this.date});
}

class NoticeCard extends StatelessWidget {
  final Notice notice;

  NoticeCard({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              notice.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                notice.date,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
