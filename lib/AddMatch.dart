import 'package:flutter/material.dart';

// Add match

class AddMatch extends StatefulWidget {
  @override
  _AddMatchState createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  final List<Map<String, String>> ballDetails = [];
  final TextEditingController overController = TextEditingController();
  final TextEditingController ballNumberController = TextEditingController();
  final TextEditingController batsmanController = TextEditingController();
  final TextEditingController bowlerController = TextEditingController();
  final TextEditingController runTypeController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  void _addBallDetails() {
    setState(() {
      ballDetails.add({
        "Over": overController.text,
        "Ball": ballNumberController.text,
        "Batsman": batsmanController.text,
        "Bowler": bowlerController.text,
        "Run Type": runTypeController.text,
        "Result": resultController.text,
      });

      // Clear input fields after adding the ball details
      overController.clear();
      ballNumberController.clear();
      batsmanController.clear();
      bowlerController.clear();
      runTypeController.clear();
      resultController.clear();
    });
  }

  void _clearAll() {
    setState(() {
      ballDetails.clear();
    });
  }

  void _saveMatch() {
    // Save the match details (e.g., upload to a database)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Match details saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Match"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input fields for ball details
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: overController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Over Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: ballNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Ball Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: batsmanController,
                    decoration: InputDecoration(
                      labelText: "Batsman",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: bowlerController,
                    decoration: InputDecoration(
                      labelText: "Bowler",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: runTypeController,
                    decoration: InputDecoration(
                      labelText: "Run Type (e.g., Boundary, Single)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: resultController,
                    decoration: InputDecoration(
                      labelText: "Result (e.g., 4 runs, Wicket)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _addBallDetails,
                        child: Text("Add Ball"),
                      ),
                      ElevatedButton(
                        onPressed: _clearAll,
                        child: Text("Clear All"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Display the list of added ball details
            Expanded(
              child: ListView.builder(
                itemCount: ballDetails.length,
                itemBuilder: (context, index) {
                  final detail = ballDetails[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                          "Over: ${detail["Over"]}, Ball: ${detail["Ball"]}"),
                      subtitle: Text(
                          "Batsman: ${detail["Batsman"]}, Bowler: ${detail["Bowler"]}, Run Type: ${detail["Run Type"]}, Result: ${detail["Result"]}"),
                    ),
                  );
                },
              ),
            ),
            // Save match button
            ElevatedButton(
              onPressed: _saveMatch,
              child: Text("Save Match"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
