import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';
    if(resultScore >= 28)
    {
      resultText = 'You are awesome!';
    }
    else if(resultScore >= 15 && resultScore < 28){
      resultText = 'You are boring.';
    }
    else
    {
      resultText = 'You are strange.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
        Column(
          children: <Widget>[
            Text(resultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, ),),
            FlatButton(
              child: Text("Restart Quiz!"),
              onPressed: resetHandler,
              ),
          ],
        )
      );
  }
}
