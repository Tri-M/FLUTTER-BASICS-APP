import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;

  Result(this.resultscore,this.resetHandler);

  String get resultphrase {
    var resulttext;
    if (resultscore >= 25) {
      resulttext = "You are good";
    } else if (resultscore >= 15 && resultscore < 25) {
      resulttext = "You are average!";
    } else {
      resulttext = "You need improvement !";
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultphrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart quiz'),
            textColor:Colors.red,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
