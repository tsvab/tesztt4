import 'package:flutter/material.dart';
import 'list1.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Row(
        children: [
          //List1(),
          List1(),
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
