import 'package:flutter/material.dart';
import 'package:tesztt4/cardppid1.dart';

class PageCardPpid extends StatelessWidget {
  final ppid;

  PageCardPpid(this.ppid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePpid'),
      ),
      body: CardPpid1(ppid: ppid),
    );
  }
}
