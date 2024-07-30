import 'package:flutter/material.dart';

void main() => runApp(const LocalDirectoryApp());

class LocalDirectoryApp extends StatelessWidget {
  const LocalDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LocalDirectoryPage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class LocalDirectoryPage extends StatelessWidget {
  const LocalDirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.orange, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('Local Directory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for places...',
                icon: Icon(Icons.search, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              children: List.generate(10, (index) {
                return DirectoryGridItem(
                  imageUrl: 'https://example.com/image.jpg',
                  businessName: 'Business $index',
                  category: 'Category',
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class DirectoryGridItem extends StatelessWidget {
  final String imageUrl;
  final String businessName;
  final String category;

  const DirectoryGridItem({super.key,
    required this.imageUrl,
    required this.businessName,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 8.0),
          Text(
            businessName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            category,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child:  const Text('Details'),
          ),
        ],
      ),
    );
  }
}
