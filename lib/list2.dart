import 'package:flutter/material.dart' ;
import 'package:grouped_list/grouped_list.dart' ;
//import 'api1.dart' ;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

//Future<List<Kiallito>> fetchKiallito() async {
Future<List<dynamic>> fetchKiallito() async {

  final String url = "https://eregistrator.hu/6/index.php?r=kialllista/kialllista1/list&pridlist=IND20&orgid=00158376&lngid=hu&pagesize=50&mode=K&up=1&upevent=ipar-napjai&output=json" ;
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Kiallito.fromJson(jsonDecode(response.body));
print( 'response statuscode: ${response.statusCode}');
    Iterable list = jsonDecode(response.body) ;
//print( 'list: $list' );
//    return list.map((item) => Kiallito.fromJson(item)).toList();
  return list ;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class List2 extends StatefulWidget {

  //FutureMap<String, dynamic> _elements ;

  //List<Kiallito> _elements = [] ;
  @override
  _List2State createState() => _List2State();
}

class _List2State extends State<List2> {
  var _elements = List<dynamic>() ;

  // List _elements2 = [
  //   {'name': 'John', 'group': 'Team A'},
  //   {'name': 'Will', 'group': 'Team B'},
  //   {'name': 'Beth', 'group': 'Team A'},
  //   {'name': 'Miranda', 'group': 'Team B'},
  // ] ;


  Future<bool> getKiallito() async {
  // Future<void> getKiallito() async {
    await fetchKiallito().then(
             (value) {
//           if (mounted) {
//             setState(() => {_elements = value});
//             // _elements = value;
               _elements = value;
//               _elements.add( name: value['name'], group: value['group'] ) ;
 print("elements 1 : $_elements");
             }
    );
    return true ;
   }

  // Widget _buildGroupSeparator(dynamic groupByValue) {
  //   return Text('$groupByValue');
  // }

  getX() async {
    _elements = await fetchKiallito();
  }

  @override
  void initState()  {
    super.initState();
    // getX();
    // getKiallito();
print('elements 0: $_elements');
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getKiallito(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//print( 'snapshot: $snapshot' );
//print( 'snapshot: ${snapshot.hasData}' );
        if (snapshot.hasData) {
//print('elements 222: $_elements');
//print('elements 333: $_elements2');
          return Expanded(
            child: GroupedListView<dynamic, String>(
              elements: _elements,
              groupBy: (element) => element['group'],
              itemComparator: (item1, item2) =>
                  item1['name'].compareTo(item2['name']),
              itemBuilder: (c, element) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(1.0),
                    ),
                  ),
                  elevation: 2.0,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    child: ListTile(
                      onTap: (){},
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      // leading: Icon(Icons.account_circle),
                      leading: SizedBox(
                        child: element['urllogo'] == ''
                            ? Container()
                            // : Image.network(element['urllogo']),
                            : CachedNetworkImage(
                                imageUrl: element['urllogo'],
                                placeholder: (context, url) => Container(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                        width: 100,
                      ),

                      title: Text(element['name']),
                      //trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
              groupSeparatorBuilder: (String value) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
              order: GroupedListOrder.ASC,
            ),
          );
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
      }
    ) ;
  }
}


