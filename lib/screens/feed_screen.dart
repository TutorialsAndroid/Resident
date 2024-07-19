import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Post> _posts = [
    Post(
      username: 'Shinchan',
      content: 'This is the first post!',
      timestamp: DateTime.now(),
      profileImageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
    ),
    Post(
      username: 'Michi',
      content: 'Hello, Twitter!',
      timestamp: DateTime.now(),
      profileImageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
    ),
    Post(
      username: 'Yoshirin',
      content: 'Flutter is amazing!',
      timestamp: DateTime.now(),
      profileImageUrl: null, // Intentionally set to null to test default image handling
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: _posts[index]);
        },
      ),
    );
  }
}

class Post {
  final String username;
  final String content;
  final DateTime timestamp;
  final String? profileImageUrl; // Make profileImageUrl nullable

  Post({
    required this.username,
    required this.content,
    required this.timestamp,
    this.profileImageUrl,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                post.profileImageUrl ?? 'https://via.placeholder.com/200',
              ),
              radius: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(post.content),
                  const SizedBox(height: 8.0),
                  Text(
                    '${post.timestamp.hour}:${post.timestamp.minute}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}