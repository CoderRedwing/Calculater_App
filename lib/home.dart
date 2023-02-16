import 'package:calculater/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculater extends StatefulWidget {
  const Calculater({Key? key}) : super(key: key);

  @override
  State<Calculater> createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {

  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideInput=false;
  var outputSize=34.0;

  onButtonClick(value) {

    if (value == "AC") {
      input = "";
      output = "";
    }
    else if (value == "<") {
      if(input.isNotEmpty){
        input = input.substring(0, input.length - 1);
      }

    } else if (value == "=") {
      if(input.isNotEmpty){
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith(".0")){
          output= output.substring(0,output.length-2);
        }
        input=output;
        hideInput=true;
        outputSize=52;
      }

    } else {
      input = input + value;
      hideInput=false;
      outputSize=34;
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child:
          Container(
            width: double.infinity,
            color: Colors.black54,
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text( hideInput?"":input,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,

                  ),
                ),
                const SizedBox(height: 25,),
                Text(output,
                  style: TextStyle(
                    fontSize: outputSize,
                    color: Colors.white.withOpacity(0.7),

                  ),
                ),
                const SizedBox(height: 30,),
              ],

            ),
          )),
          Row(
            children: [
              button(text: 'AC',
                  buttonBgColor: operatorColor,
                  tColor: orangeColor),
              button(
                  text: '<', buttonBgColor: operatorColor, tColor: orangeColor),
              button(text: '', buttonBgColor: Colors.transparent),
              button(
                  text: '/', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(
                  text: 'x', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6',),
              button(
                  text: '-', buttonBgColor: operatorColor, tColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '+'),
            ],
          ),
          Row(
            children: [
              button(
                  text: '%', buttonBgColor: operatorColor, tColor: orangeColor),
              button(text: '0'),
              button(text: '.'),
              button(text: '=', buttonBgColor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text, tColor = Colors.white, buttonBgColor = buttonColor,
  }) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              primary: buttonBgColor,
              padding: const EdgeInsets.all(22),
            ),
            onPressed: () => onButtonClick(text),
            child: Text(text, style: TextStyle(fontSize: 20,
                color: tColor,
                fontWeight: FontWeight.bold),),
          ),
        )
    );
  }


}




