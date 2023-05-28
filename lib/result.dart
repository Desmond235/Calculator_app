import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
   Result({super.key, required this.userInput, required this.result});
String userInput;
String result;
  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       Container(
         padding: const EdgeInsets.all(20),
         alignment: Alignment.centerRight,
         child: Text(
           userInput,
           style: const TextStyle(fontSize: 32),
         ),
       ),
       Container(
         padding: const EdgeInsets.all(20),
         alignment: Alignment.centerRight,
         child: FittedBox(
           child: Text(
             result,
             style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
           ),
         ),
       ),
     ],
   );
  }
}