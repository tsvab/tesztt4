import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({Key key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String text = '';
  bool shouldDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 200,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
          ),
        ),
        FlatButton(
            onPressed: () {
              setState(() {
                shouldDisplay = !shouldDisplay;
              });
            },
            child: Text('Submit')),
        shouldDisplay ? Text(text) : Spacer()
      ],
    );
  }
}
