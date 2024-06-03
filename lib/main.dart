import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  // List<String> questions = [
  //   "khalid maha certificate flutter",
  //   "flutter was released in 2017",
  //   "flutter is the best framework in mobile Application developement"
  // ];
  List<Questions> questions = [
    Questions(q: 'khalid maha certificate flutter', a: false),
    Questions(q: "flutter was released in 2017", a: true),
    Questions(
        q: "flutter is the best framework in mobile Application developement",
        a: true),
  ];
  // List<bool> answers = [false, true, true];
  int questionIndex = 0;
  int Correctanswer = 0;
  int falseanswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 44, 54),
        body: Column(children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questions[questionIndex].questionName!,
                textAlign: TextAlign.center,
                // "Halkani Waa Meesha ay suaashu Kasoo muuqan lahayd",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22),
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        final IsCorrect =
                            questions[questionIndex].questionanswers;

                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex++;
                          else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Results(
                                      answer: Correctanswer,
                                      falses: falseanswer),
                                ));
                          }
                        });
                        if (IsCorrect == true) {
                          print("Waad saxday suuashan");
                          setState(() {
                            Correctanswer = Correctanswer + 1;
                          });
                          1;
                        } else {
                          print("waad qaladay suaashan");
                          setState(() {
                            falseanswer = falseanswer + 1;
                          });
                        }
                      },
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 22,
                        right: 22,
                        bottom: 20,
                      ),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          final IsFalse =
                              questions[questionIndex].questionanswers;

                          if (IsFalse == false) {
                            print("waad saxday suaashan");
                            setState(() {
                              Correctanswer = Correctanswer + 1;
                            });
                          } else {
                            print("waad qaladay suaashan");
                            setState(() {
                              falseanswer = falseanswer + 1;
                            });
                          }
                          setState(() {
                            if (questionIndex < questions.length - 1)
                              questionIndex++;
                            else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Results(
                                          answer: Correctanswer,
                                          falses: falseanswer)));
                            }
                          });
                        },
                        child: Text(
                          "Flase",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
