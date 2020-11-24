import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:http/http.dart' as http;

class CardPpid1 extends StatelessWidget {
  final String ppid;
  // final String cegnev1;
  // final String urllogo;

  // CardPpid1({Key key, this.ppid = '', this.cegnev1 = '', this.urllogo = ''})
  //     : super(key: key);
  CardPpid1(this.ppid);
  // Print () {
  //   print( 'cegnev1: $this.urllogo, urllogo: $this.urllogo' );
  // } ;

  // @override
  // String toString() {
  //   return 'ListCard1: {cegnev1: ${cegnev1}, urllogo: ${urllogo}}';
  // }

  @override
  Widget build(BuildContext context) {
    return Text(ppid);
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(1.0),
//         ),
//       ),
//       elevation: 2.0,
//       margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//       child: Container(
//         child: ListTile(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PagePpid()),
//               );
//             },
//             contentPadding:
//             EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// // leading: Icon(Icons.account_circle),
//             leading: SizedBox(
//               child: urllogo == ''
//                   ? Container()
// // : Image.network(element['urllogo']),
//                   : CachedNetworkImage(
//                 imageUrl: urllogo,
//                 placeholder: (context, url) => Container(),
//                 //errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//               width: 100,
//             ),
//             title: Text(cegnev1) //trailing: Icon(Icons.arrow_forward),
//         ),
//       ),
//     );
  }
}
