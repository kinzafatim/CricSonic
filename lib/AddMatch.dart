import 'package:flutter/material.dart';

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
    if (overController.text.isEmpty ||
        ballNumberController.text.isEmpty ||
        batsmanController.text.isEmpty ||
        bowlerController.text.isEmpty ||
        runTypeController.text.isEmpty ||
        resultController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() {
      ballDetails.add({
        "Over": overController.text,
        "Ball": ballNumberController.text,
        "Batsman": batsmanController.text,
        "Bowler": bowlerController.text,
        "Run Type": runTypeController.text,
        "Result": resultController.text,
      });

      // Clear input fields after adding
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
        backgroundColor: Color.fromARGB(255, 196, 57, 57),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input fields for ball details
            Expanded(
              child: ListView(
                children: [
                  _buildTextField(
                    controller: overController,
                    labelText: "Over Number",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: ballNumberController,
                    labelText: "Ball Number",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: batsmanController,
                    labelText: "Batsman",
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: bowlerController,
                    labelText: "Bowler",
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: runTypeController,
                    labelText: "Run Type (e.g., Boundary, Single)",
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: resultController,
                    labelText: "Result (e.g., 4 runs, Wicket)",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _addBallDetails,
                        child: Text("Add Ball"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _clearAll,
                        child: Text("Clear All"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Display the list of added ball details
            Expanded(
              child: ballDetails.isEmpty
                  ? Center(
                      child: Text(
                        "No ball details added yet",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: ballDetails.length,
                      itemBuilder: (context, index) {
                        final detail = ballDetails[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              "Over: ${detail["Over"]}, Ball: ${detail["Ball"]}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Batsman: ${detail["Batsman"]}, Bowler: ${detail["Bowler"]}\nRun Type: ${detail["Run Type"]}, Result: ${detail["Result"]}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
            // Save match button
            ElevatedButton(
              onPressed: _saveMatch,
              child: Text("Save Match"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 196, 57, 57),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType, 
      style: TextStyle(
      color: Colors.black, // Set the desired text color here
      fontSize: 16,        // Optional: Adjust font size if needed
    ),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}

