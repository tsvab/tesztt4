import 'package:flutter/material.dart';
import 'package:tesztt4/cardppid1.dart';
import 'list2.dart';

class PageCardPpid extends StatelessWidget {
  final ppid;

  PageCardPpid(this.ppid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePpid'),
      ),
      body: Row(
        children: [
          //List1(),
          CardPpid1(ppid),
          // Expanded(
          //   // flex: 3,
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: Align(
          //           child:
          //           FloatingActionButton(
          //             backgroundColor: Colors.yellow,
          //             onPressed: (){
          //               Navigator.pop(context) ;
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //
          //   ),
          // ),
        ],
      ),
    );
  }
}
