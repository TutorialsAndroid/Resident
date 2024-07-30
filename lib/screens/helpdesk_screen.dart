import 'package:flutter/material.dart';

void main() {
  runApp(HelpDeskPage());
}

class HelpDeskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Help Desk'),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.tealAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can we help you?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCategoryCard(Icons.computer, 'Technical'),
                        _buildCategoryCard(Icons.money, 'Billing'),
                        _buildCategoryCard(Icons.info, 'General'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Popular Articles',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildArticleListTile('How to reset your password'),
                    _buildArticleListTile('Understanding your bill'),
                    _buildArticleListTile('Contacting support'),
                    SizedBox(height: 20),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildContactButton(Icons.email, 'Email'),
                        _buildContactButton(Icons.phone, 'Call'),
                        _buildContactButton(Icons.chat, 'Chat'),
                      ],
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

  Widget _buildCategoryCard(IconData icon, String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleListTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        // Handle article tap
      },
    );
  }

  Widget _buildContactButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle contact button press
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
      ),
    );
  }
}
