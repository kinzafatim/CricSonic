import 'package:flutter/material.dart';

class CricketGroundListScreen extends StatelessWidget {
  final List<Map<String, String>> grounds = [
    {'name': 'Eden Gardens'},
    {'name': 'Lord\'s Cricket Ground'},
    {'name': 'Melbourne Cricket Ground'},
    {'name': 'Wankhede Stadium'},
    {'name': 'Newlands'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cricket Grounds'),
      ),
      body: ListView.builder(
        itemCount: grounds.length,
        itemBuilder: (context, index) {
          return CricketGroundListItem(
            name: grounds[index]['name']!,
          );
        },
      ),
    );
  }
}

class CricketGroundListItem extends StatelessWidget {
  final String name;

  const CricketGroundListItem({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.blueGrey.shade100, // Background color for each item
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
