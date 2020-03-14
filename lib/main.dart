import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp()); // Pass object of main widget.
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questionsList = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Black', 'score': 3},
        {'text': 'Blue', 'score': 8},
        {'text': 'Green', 'score': 3},
        {'text': 'Orange', 'score': 7}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 15},
        {'text': 'Cat', 'score': 6},
        {'text': 'Rabbit', 'score': 9},
        {'text': 'Lion', 'score': 12},
        {'text': 'Tiger', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite food?',
      'answers': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Home-food', 'score': 15},
        {'text': 'Italian', 'score': 4},
        {'text': 'Mexican', 'score': 4},
        {'text': 'Chinese', 'score': 2}]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz()
  {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;      
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _questionsList.length) {
      print('We have more questions!');
    }
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });

    print(_questionIndex);
  }

  @override // Just a decorator, not neccessary but good practice to include it.
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Hello!'),
            ),
            body: _questionIndex < _questionsList.length
                ? Quiz(_answerQuestion, _questionsList, _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}
