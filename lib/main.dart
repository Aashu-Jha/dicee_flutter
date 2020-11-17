import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.black45,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1; //left dice face
  int rightDiceNumber = 1; //right dice face
  var check = false;
  var pressAttention = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Roll Dice',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Divider(
          color: Colors.white,
          indent: 50,
          endIndent: 50,
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  if (check)
                    changeDiceFace();
                  else
                    changeDice1();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  if (check)
                    changeDiceFace();
                  else {
                    changeDice2();
                  }
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 80,
        ),
        ButtonBar(
          buttonMinWidth: 200.0,
          buttonHeight: 50.0,
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                if (check) check = false;
                setState(() => pressAttention = !pressAttention);
              },
              color: pressAttention ? Colors.lightBlue[400] : Colors.white,
              child: Text('One Dice'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                if (!check) check = true;
                setState(() => pressAttention = !pressAttention);
              },
              color: pressAttention ? Colors.white : Colors.lightBlue[400],
              highlightColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text('Both Dice'),
            ),
          ],
        ),
      ],
    );
  }

  //function to change the dice face
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void changeDice1() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void changeDice2() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
