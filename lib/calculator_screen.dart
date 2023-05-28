import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/button_list.dart';
import 'package:calculator/get_bgcolor.dart';
import 'package:calculator/get_color.dart';
import 'package:calculator/result.dart';
// ignore: must_be_immutable
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = "";
  String result = "0";
  
  List<String> buttonItems = buttonList;

  void press(){

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(220, 0, 0, 0).withOpacity(0.87),
          ),
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 231, 250, 255).withOpacity(0.8),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height / 2.95,
                child: Result(userInput: userInput, result: result),
              ),
              Expanded(child: bottomWidget()),
            ],
          ),
        ),
      ),
    );
  }

// bottom widget
  Widget bottomWidget(){
    return Container(
      padding: const EdgeInsets.all(15),
     
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttonList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return button(buttonItems[index]);
        },
      ),
    );
  }

   Widget button(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          handleButtonPress(text);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: getColor(text),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  
  handleButtonPress(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "C") {
      // ignore: prefer_is_empty
      if (userInput.length > 0) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == "=") {
      result = calculate();
      userInput = result;
      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }
      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
      }
      return;
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
