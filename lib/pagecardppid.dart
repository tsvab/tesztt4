import 'package:flutter/material.dart';

import 'cardppid2.dart';

class PageCardPpid extends StatelessWidget {
  final ppid;

  PageCardPpid(this.ppid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePpid'),
      ),
      body: CardPpid2(ppid: ppid),
    );
  }
}
