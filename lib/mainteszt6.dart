import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Example"),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // new CircleAvatar(
                //   backgroundColor: Colors.blue,
                //   child: new Text("AB"),
                // ),
                new Expanded(
                  child: new Column(
                    children: [
                      new TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Please enter a lot of text',
                        ),
                      ),
                      new Container(
                        //height: 600.0,
                        width: 100.0,
                        color: Colors.green,
                        child: Text('zöldddd'),
                      ),
                      Text('végén'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
