import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'When last did you wash your hands?',
      'answers': [
        {'text': 'Just Now', 'score': 1},
        {'text': '5 minutes ago', 'score': 1},
        {'text': '30 minutes ago', 'score': 3},
        {'text': 'An hour ago', 'score': 4},
        {'text': 'Close to now', 'score': 4},
        {'text': 'Other', 'score': 7},
      ],
    },
    {
      'questionText': 'Is your temperature higher than 36.7 degrees celsius?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 1},
        {'text': 'Not sure', 'score': 5},
      ],
    },
    {
      'questionText': 'Do you have cough?',
      'answers': [
        {'text': 'Yes', 'score': 7},
        {'text': 'No', 'score': 1},
        {'text': 'Not really', 'score': 3},
      ],
    },
    {
      'questionText': 'Are you having chest pain?',
      'answers': [
        {'text': 'Yes', 'score': 7},
        {'text': 'No', 'score': 1},
      ],
    },
    {
      'questionText': 'Are you experiencing Shortness of breath?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 1},
        {'text': 'Kind of', 'score': 4},
      ],
    },
    {
      'questionText': 'Do you have diarrhea?',
      'answers': [
        {'text': 'Yes', 'score': 8},
        {'text': 'No', 'score': 2},
      ],
    },
    {
      'questionText': 'Are you experiencing loss of taste or smell?',
      'answers': [
        {'text': 'Yes', 'score': 9},
        {'text': 'No', 'score': 1},
        {'text': 'A little bit', 'score': 3},
      ],
    },
    {
      'questionText': 'Have you just returned from a trip in the last 14 days?',
      'answers': [
        {'text': 'Yes', 'score': 8},
        {'text': 'No', 'score': 1},
      ],
    },
    {
      'questionText':
          'Have you come in contact with someone who returned from a trip in the last 14 days?',
      'answers': [
        {'text': 'Yes', 'score': 8},
        {'text': 'No', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    var questions;
    if (_questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ['Hello'];
    // dummy.add('Dave');
    // print(dummy);
    // dummy = [];
    // questions = []; does not work if variable is unmodifiable

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('                  9ja Free Covid-19 Test'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
