import 'package:flutter/material.dart';
import 'package:tesztt4/question.dart';
import 'question.dart';

class PageTeszt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageTeszt'),
        ),
        body: Row(
          children: [
            //List1(),
            Question(),
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
      ),
    );
  }
}
