import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var userInput = " ";
  var answer = " ";
  List<String> history = [];
  bool showHistory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'History') {
                setState(() {
                  showHistory = !showHistory;
                });
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'History',
                child: Text('Toggle History'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              userInput.toString(),
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            answer.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(height: 15),
                          if (showHistory) Divider(color: Colors.white),
                          if (showHistory)
                            Expanded(
                              child: ListView.builder(
                                itemCount: history.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        userInput = history[index].split(' = ')[0];
                                        answer = history[index].split(' = ')[1];
                                      });
                                    },
                                    child: Text(
                                      history[index],
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              MyButton(
                                title: "AC",
                                onPress: () {
                                  userInput = " ";
                                  answer = " ";
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "+/-",
                                onPress: () {
                                  userInput += '+/-';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "%",
                                onPress: () {
                                  userInput += '%';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "/",
                                color: Colors.orange,
                                onPress: () {
                                  userInput += '/';
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              MyButton(
                                title: "7",
                                onPress: () {
                                  userInput += '7';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "8",
                                onPress: () {
                                  userInput += '8';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "9",
                                onPress: () {
                                  userInput += '9';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "x",
                                color: Colors.orange,
                                onPress: () {
                                  userInput += 'x';
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              MyButton(
                                title: "4",
                                onPress: () {
                                  userInput += '4';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "5",
                                onPress: () {
                                  userInput += '5';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "6",
                                onPress: () {
                                  userInput += '6';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "-",
                                color: Colors.orange,
                                onPress: () {
                                  userInput += '-';
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              MyButton(
                                title: "1",
                                onPress: () {
                                  userInput += '1';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "2",
                                onPress: () {
                                  userInput += '2';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "3",
                                onPress: () {
                                  userInput += '3';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "+",
                                color: Colors.orange,
                                onPress: () {
                                  userInput += '+';
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              MyButton(
                                title: "0",
                                onPress: () {
                                  userInput += '0';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: ".",
                                onPress: () {
                                  userInput += '.';
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "DEL",
                                onPress: () {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                  setState(() {});
                                },
                              ),
                              MyButton(
                                title: "=",
                                color: Colors.orange,
                                onPress: () {
                                  equalPress();
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                      ],
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

  void equalPress() {
    String finalUSerInput = userInput;
    finalUSerInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUSerInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
    history.add('$userInput = $answer');
  }
}
