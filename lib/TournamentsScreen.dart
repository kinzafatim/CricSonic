import 'package:flutter/material.dart';

class TournamentsScreen extends StatelessWidget {
  final List<Map<String, String>> tournaments = [
    {
      'name': 'ICC Cricket World Cup 2023',
      'date': 'October 2023',
      'location': 'India'
    },
    {
      'name': 'The Ashes 2023',
      'date': 'June - July 2023',
      'location': 'England'
    },
    {
      'name': 'Indian Premier League 2023',
      'date': 'March 2023',
      'location': 'India'
    },
    {
      'name': 'Big Bash League 2023',
      'date': 'December 2023 - February 2024',
      'location': 'Australia'
    },
    {
      'name': 'CPL (Caribbean Premier League)',
      'date': 'August - September 2023',
      'location': 'West Indies'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournaments'),
      ),
      body: ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          return TournamentListItem(
            name: tournaments[index]['name']!,
            date: tournaments[index]['date']!,
            location: tournaments[index]['location']!,
          );
        },
      ),
    );
  }
}

class TournamentListItem extends StatelessWidget {
  final String name;
  final String date;
  final String location;

  const TournamentListItem({
    required this.name,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Tournament Icon
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey.shade200,
                child: Icon(
                  Icons.sports_cricket, // Cricket tournament icon
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            // Tournament Name, Date, and Location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: $date',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Location: $location',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
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