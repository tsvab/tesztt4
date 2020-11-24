import 'package:flutter/material.dart';
import 'list2.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //       title: Text('Page2'),
        //     ),
        body: Row(
          children: [
            //List1(),
            List2(),
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
