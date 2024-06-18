import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = "0";
  num number2 = 0;
  String calcKey = '';
  String lastOperation = "";
  num lastNumber = 0;

  bool isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = num.tryParse(str);
    return number != null;
  }

  void calcular(String key) {
    if (number == "0" && isNumeric(key)) {
      setState(() {
        number = "";
      });
    }
    switch (key) {
      case '=':
        if(lastNumber == 0){
          lastNumber = num.parse(number);
        }
        switch (lastOperation) {
          case '+':
            if(lastNumber != 0){
              number2 += lastNumber;
            } else {
              number2 += num.parse(number);
            }
            setState(() {
              number = "$number2";
            });
            break;
        }
        break;
      case '+':
        lastOperation = "+";
        if(lastNumber > 0){
          lastNumber = 0;
          if (number != '0') {
            if (isNumeric(number)) {
              number2 = num.parse(number);
            } else {
              // Handle invalid input
              setState(() {
                number = "Error";
              });
              return;
            }
          }
        } else {
          if (number != '0') {
            if (isNumeric(number)) {
              number2 += num.parse(number);
            } else {
              // Handle invalid input
              setState(() {
                number = "Error";
              });
              return;
            }
          }
        }
        setState(() {
          number = '0';
        });
        break;
      case '0':
        if (number == "0") {
          break;
        } else {
          setState(() {
            number += key;
          });
          break;
        }
      default:
        if (isNumeric(key)) {
          setState(() {
            number += key;
          });
        } else {
          setState(() {
            number = "0";
            number2 = 0;
            lastNumber = 0;
            lastOperation = '';
          });
        }
    }
    print(
        "Key: $key, Display: $number, Mem: $number2, LastOpr: $lastOperation, LastNumber: $lastNumber");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              "Calculadora",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(number,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular("AC");
                  },
                  child: Text("AC",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                Text(" "),
                Text(" "),
                GestureDetector(
                  onTap: () {},
                  child: Text("<X",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular("7");
                  },
                  child: Text("7",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("8");
                  },
                  child: Text("8",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("9");
                  },
                  child: Text("9",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("/");
                  },
                  child: Text("/",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular("4");
                  },
                  child: Text("4",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("5");
                  },
                  child: Text("5",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("6");
                  },
                  child: Text("6",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("X");
                  },
                  child: Text("X",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular("1");
                  },
                  child: Text("1",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("2");
                  },
                  child: Text("2",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("3");
                  },
                  child: Text("3",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("-");
                  },
                  child: Text("-",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular("0");
                  },
                  child: Text("0",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular(",");
                  },
                  child: Text(",",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("=");
                  },
                  child: Text("=",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
                GestureDetector(
                  onTap: () {
                    calcular("+");
                  },
                  child: Text("+",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35)),
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
      title: "Calculator",
      color: Colors.deepPurple,
    );
  }
}
