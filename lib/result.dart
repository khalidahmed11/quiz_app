import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.answer, required this.falses});

  final int answer;
  final int falses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your result quiz is ", style: TextStyle(fontSize: 40)),
            Text(
              "The answers are: $answer ",
              style: TextStyle(fontSize: 20),
            ),
            Text("The falses are: $falses", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change the button's background color
              ),
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
