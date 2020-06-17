import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 11) {
      resultText = 'Keep it up! Stay safe, stay home!';
    } else if (resultScore <= 12) {
      resultText = "Nice, stay safe!";
    } else if (resultScore <= 16) {
      resultText = 'Good job. Keep up the good work!';
    } else if (resultScore <= 20) {
      resultText = 'Stay safe, stay home and take regular blood tests';
    } else if (resultScore <= 25) {
      resultText = 'Well, you are safe and not really at risk...';
    } else if (resultScore <= 35 || resultScore > 35) {
      resultText = 'Pls consult your doctor! Covid-19 is real!!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Test',
            ),
            textColor: Colors.teal,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
