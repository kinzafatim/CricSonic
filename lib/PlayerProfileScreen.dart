import 'package:flutter/material.dart';

class PlayerProfileScreen extends StatelessWidget {
  final List<Map<String, String>> players = [
    {
      'name': 'Virat Kohli',
      'description': 'Indian cricketer and former captain of India.'
    },
    {
      'name': 'Steve Smith',
      'description': 'Australian cricketer and former captain of Australia.'
    },
    {
      'name': 'Ben Stokes',
      'description': 'English cricketer, known for his all-rounder abilities.'
    },
    {
      'name': 'Kane Williamson',
      'description': 'New Zealand cricketer and former captain.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Profiles'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return PlayerProfileListItem(
            name: players[index]['name']!,
            description: players[index]['description']!,
          );
        },
      ),
    );
  }
}

class PlayerProfileListItem extends StatelessWidget {
  final String name;
  final String description;

  const PlayerProfileListItem({
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          // Cricket Icon (used for player)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueGrey.shade200, // Icon background color
              child: Icon(
                Icons.sports_cricket, // Cricket icon
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          // Player Name and Description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}