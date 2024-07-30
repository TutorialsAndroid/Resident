import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrepaidMeterPage(),
    );
  }
}

class PrepaidMeterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prepaid Meter Dashboard'),
        backgroundColor: Colors.indigo,
      ),
      body: GridView.count(
        padding: EdgeInsets.all(16.0),
        crossAxisCount: 2,
        children: [
          _buildCard(Icons.account_balance_wallet, 'Balance', '\$123.45', Colors.orange),
          _buildCard(Icons.history, 'Transaction History', 'View Details', Colors.blue),
          _buildCard(Icons.settings, 'Settings', 'Adjust Settings', Colors.green),
          _buildCard(Icons.help, 'Help', 'Get Support', Colors.red),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle, Color color) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(height: 5),
              Text(subtitle, style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}
