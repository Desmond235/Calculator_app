import 'package:flutter/material.dart';
// background color
  getBgColor(String text) {
    if (text == "AC") {
      return Colors.redAccent;
    }
    if (text == "=") {
      return const Color.fromARGB(255, 104, 204, 160);
    }
    if(text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "(" ||
        text == ")"){
        return Colors.grey[700];
    }
    return Colors.white;
  }