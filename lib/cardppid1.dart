import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:http/http.dart' as http;
import 'kiallito1.dart';

class CardPpid1 extends StatefulWidget {
  final String ppid;
//  CardPpid1({Key key, @required this.recordObject}) : super(key: key);
  CardPpid1({Key key, this.ppid}) : super(key: key);

  @override
  _CardPpid1State createState() => _CardPpid1State(ppid);
}

class _CardPpid1State extends State<CardPpid1> {
  String ppid;
  Kiallito kiallito;

  _CardPpid1State(this.ppid); //constructor

  Future<bool> getKiallito(ppid) async {
    // Future<void> getKiallito() async {
    await fetchKiallito(ppid).then((value) {
      kiallito = value;
      print(kiallito);
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getKiallito(ppid),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Text('van adat');
          } else {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
