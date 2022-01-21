import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'package:flutter/widgets.dart';
import './result.dart';
import './quiz.dart';

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
  static const _questions = const [
    {
      'questionText': 'What\'s the capital of India?',
      'answers': [
        {'text': 'New Delhi', 'score': 10},
        {'text': 'Mumbai', 'score': 4},
        {'text': 'Chennai', 'score': 7},
        {'text': 'Kolkata', 'score': 3}
      ],
    },
    {
      'questionText': 'Which is the largest creature?',
      'answers': [
        {'text': 'Blue Whale', 'score': 10},
        {'text': 'Mammoth', 'score': 10},
        {'text': 'Dolphin', 'score': 10},
        {'text': 'T-Rex', 'score': 10}
      ],
    },
    {
      'questionText': 'Chennai gets its name from?',
      'answers': [
        {'text': 'Madras', 'score': 10},
        {'text': 'Chennapattinam', 'score': 15},
        {'text': 'Madrasapattinam', 'score': 5},
        {'text': 'Madhraas', 'score': 3}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetquiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    // const questions = const [
    //   {
    //     'questionText': 'What\'s the capital of India?',
    //     'answers': ['New Delhi', 'Mumbai', 'Chennai', 'Kolkata'],
    //   },
    //   {
    //     'questionText': 'Which is the largest creature?',
    //     'answers': ['Blue Whale', 'Mammoth', 'Elephant', 'Dinosaur'],
    //   },
    //   {
    //     'questionText': 'Chennai gets its name from?',
    //     'answers': ['Madras', 'Chennapattinam', 'Madrasapattinam', 'Madhraas'],
    //   },
    // ];

    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetquiz),
      ),
    );
  }
}
