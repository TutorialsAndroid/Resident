import 'package:flutter/material.dart';

void main() {
  runApp(ModernUtilitiesPaymentPage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Utilities Payment',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class ModernUtilitiesPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilities Payment'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pay Your Utilities',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Select Utility',
                      border: OutlineInputBorder(),
                    ),
                    value: 'Electricity',
                    onChanged: (newValue) {},
                    items: ['Electricity', 'Water', 'Gas', 'Internet']
                        .map((utility) {
                      return DropdownMenuItem(
                        child: Text(utility),
                        value: utility,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.payment),
      ),
    );
  }
}
