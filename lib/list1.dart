import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
//import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'kiallito1.dart';
import 'listcard1.dart';

class Kiallito {
  final String ppid;
  final String cegnev1;
  final String urllogo;
  final bool favourite;

  Kiallito(
      {this.ppid = '',
      this.cegnev1 = '',
      this.urllogo = '',
      this.favourite = false});
}

class List1 extends StatefulWidget {
  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  List<Kiallito> kiallitoList = [];
  List<String> strList = [];
  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();

  Future<bool> getKiallitok() async {
    await fetchKiallito().then((value) {
      print(value.length);
      value.forEach((element) {
        kiallitoList.add(Kiallito(
            ppid: element['ppid'],
            cegnev1: element['name'],
            urllogo: element['urllogo']));
      });
      kiallitoList.sort(
          (a, b) => a.cegnev1.toLowerCase().compareTo(b.cegnev1.toLowerCase()));
    });
    return true;
  }

  Future<bool> filteredList() async {
    //print('kiallitoList.isEmpty: {kiallitoList.isEmpty()}');
    if (kiallitoList.isEmpty) {
      print("kiallitoList List is empty");
      await getKiallitok().then((value) {
        //print('kiallitoList: $kiallitoList');
        if (kiallitoList.isEmpty) {
          //print("List is not empty");
          return false;
        }
      });
    }

    favouriteList = [];
    normalList = [];
    strList = [];

    List<Kiallito> kiallitoListFiltered = [];
    print(kiallitoList.length);

    kiallitoListFiltered.clear();
    kiallitoListFiltered.addAll(kiallitoList);
    if (searchController.text.isNotEmpty) {
      kiallitoListFiltered.retainWhere((kiallito) => kiallito.cegnev1
          .toLowerCase()
          .contains(searchController.text.toLowerCase()));
    }
    print(kiallitoListFiltered.length);

    kiallitoListFiltered.forEach((kiallito) {
      if (true) {
        //print('kiallitoListFiltered : ${kiallito.cegnev1} ');
        strList.add(kiallito.cegnev1.toUpperCase());

        normalList.add(ListCard1(
                ppid: kiallito.ppid,
                cegnev1: kiallito.cegnev1,
                urllogo: kiallito.urllogo)

            // Slidable(
            //   actionPane: SlidableDrawerActionPane(),
            //   actionExtentRatio: 0.1,
            //   secondaryActions: <Widget>[
            //     IconSlideAction(
            //       iconWidget: Icon(Icons.star),
            //       onTap: () {},
            //     ),
            //     IconSlideAction(
            //       iconWidget: Icon(Icons.more_horiz),
            //       onTap: () {},
            //     ),
            //   ],
            //   child: ListTile(
            //     leading: CircleAvatar(
            //         //backgroundImage: NetworkImage("http://placeimg.com/200/200/people"),
            //         ),
            //     title: Text(kiallito.cegnev1),
            //     subtitle: Text(''),
            //   ),
            // ),

            );
      }
    });

    setState(() {
      favouriteList;
      normalList;
      strList;
    });

    return true;
  }

  @override
  void initState() {
    // for (var i = 0; i < 100; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), false));
    // }
    // for (var i = 0; i < 4; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), true));
    // }
    // userList
    //     .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    //filteredList();
    searchController.addListener(() {
      filteredList();
    });
    super.initState();
  }

  // filterList() {
  //   // List<Kiallito> users = [];
  //   users.addAll(userList);
  //   favouriteList = [];
  //   normalList = [];
  //   strList = [];
  //   if (searchController.text.isNotEmpty) {
  //     users.retainWhere((user) => user.name
  //         .toLowerCase()
  //         .contains(searchController.text.toLowerCase()));
  //   }
  //   users.forEach((user) {
  //     if (user.favourite) {
  //       favouriteList.add(
  //         Slidable(
  //           actionPane: SlidableDrawerActionPane(),
  //           actionExtentRatio: 0.25,
  //           secondaryActions: <Widget>[
  //             IconSlideAction(
  //               iconWidget: Icon(Icons.star),
  //               onTap: () {},
  //             ),
  //             IconSlideAction(
  //               iconWidget: Icon(Icons.more_horiz),
  //               onTap: () {},
  //             ),
  //           ],
  //           child: ListTile(
  //             leading: Stack(
  //               children: <Widget>[
  //                 CircleAvatar(
  //                   backgroundImage:
  //                       NetworkImage("http://placeimg.com/200/200/people"),
  //                 ),
  //                 Container(
  //                     height: 40,
  //                     width: 40,
  //                     child: Center(
  //                       child: Icon(
  //                         Icons.star,
  //                         color: Colors.yellow[100],
  //                       ),
  //                     ))
  //               ],
  //             ),
  //             title: Text(user.name),
  //             subtitle: Text(user.company),
  //           ),
  //         ),
  //       );
  //     } else {
  //       normalList.add(
  //         Slidable(
  //           actionPane: SlidableDrawerActionPane(),
  //           actionExtentRatio: 0.1,
  //           secondaryActions: <Widget>[
  //             IconSlideAction(
  //               iconWidget: Icon(Icons.star),
  //               onTap: () {},
  //             ),
  //             IconSlideAction(
  //               iconWidget: Icon(Icons.more_horiz),
  //               onTap: () {},
  //             ),
  //           ],
  //           child: ListTile(
  //             leading: CircleAvatar(
  //               backgroundImage:
  //                   NetworkImage("http://placeimg.com/200/200/people"),
  //             ),
  //             title: Text(user.name),
  //             subtitle: Text(user.company),
  //           ),
  //         ),
  //       );
  //       strList.add(user.name);
  //     }
  //   });
  //
  //   setState(() {
  //     favouriteList;
  //     normalList;
  //     strList;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var currentStr = "";
    // print('strList $strList');
    // print('normalList $normalList');
    // print('favouriteList $favouriteList');
    return FutureBuilder(
        future: filteredList(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//print( 'snapshot: $snapshot' );
//print( 'snapshot: ${snapshot.hasData}' );
          if (snapshot.hasData) {
//print('elements 222: $_elements');
//print('elements 333: $_elements2');
            return Expanded(
              child: AlphabetListScrollView(
                strList: strList,
                highlightTextStyle: TextStyle(
                  color: Colors.black,
                ),
                showPreview: true,
                itemBuilder: (context, index) {
                  return normalList[index];
                },
                indexedHeight: (i) {
                  return 80;
                },
                keyboardUsage: true,
                headerWidgetList: <AlphabetScrollListHeader>[
                  AlphabetScrollListHeader(
                      widgetList: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // suffix: Icon(
                              //   Icons.search,
                              //   color: Colors.grey,
                              // ),
                              labelText: "Search",
                            ),
                          ),
                        )
                      ],
                      icon: Icon(Icons.search),
                      indexedHeaderHeight: (index) => 80),
                  AlphabetScrollListHeader(
                      widgetList: favouriteList,
                      icon: Icon(Icons.star),
                      indexedHeaderHeight: (index) {
                        return 80;
                      }),
                ],
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
