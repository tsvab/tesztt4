import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
//import 'api1.dart' ;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'kiallito1.dart';

class List2 extends StatefulWidget {
  //FutureMap<String, dynamic> _elements ;

  //List<Kiallito> _elements = [] ;
  @override
  _List2State createState() => _List2State();
}

class _List2State extends State<List2> {
  var _elements = List<dynamic>();

  Future<bool> getKiallito() async {
    // Future<void> getKiallito() async {
    await fetchKiallito().then((value) {
      _elements = value;
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    // getKiallito();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getKiallito(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: GroupedListView<dynamic, String>(
                elements: _elements,
                groupBy: (element) => element['group'],
                itemComparator: (item1, item2) =>
                    //item1['name'].compareTo(item2['name']),
                    item1['name']
                        .toLowerCase()
                        .compareTo(item2['name'].toLowerCase()),
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
                        onTap: () {},
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        // leading: Icon(Icons.account_circle),
                        leading: SizedBox(
                          child: element['urllogo'] == ''
                              ? Container()
                              // : Image.network(element['urllogo']),
                              : CachedNetworkImage(
                                  imageUrl: element['urllogo'],
                                  placeholder: (context, url) => Container(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                          width: 100,
                        ),

                        title: Text(element['name']),
                        //trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                  );
                },
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        });
  }
}
