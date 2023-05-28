import 'package:flutter/material.dart';

// text color
  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "(" ||
        text == ")") {
      return Colors.white;
    }
    if (text =="C") {
      return Colors.redAccent;
    }
    if (text == "=" || text == "AC") {
      return Colors.white;
    }
    return Colors.indigo;
  }
