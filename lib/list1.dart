import 'package:flutter/material.dart' ;
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'kiallito1.dart' ;



class List1 extends StatefulWidget {
  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {

  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  List<String> strList = [];

  List<dynamic>  _elements;

  Future<bool> getKiallito() async {
print('HAHO5 getKiallito');
    await fetchKiallito().then(
            (value) {
//           if (mounted) {
//             setState(() => {_elements = value});
          _elements = value;
//               _elements.add( name: value['name'], group: value['group'] ) ;
//print("elements 1 : $_elements");
        }
    );
    return true ;
  }


  filterList() {
    favouriteList = [];
    normalList = [];
    strList = [];


    setState(() {
      favouriteList;
      normalList;
      strList;
    });
  }

  @override
  void initState() {
print('HAHO Initstate');
    getKiallito() ;
//print('_elements: $_elements') ;
    //
    // for (var i = 0; i < 100; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), false));
    // }
    // for (var i = 0; i < 4; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), true));
    // }
    // userList.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    // filterList();
    // searchController.addListener(() {
    //   filterList();
    // });
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // return AlphabetListScrollView(
    //     strList: strList,
    //     indexedHeight: null
    // );
    return Text('sssSSSWWWWQQQRRRREEFFFFFEEEEEEEERRQQQQQ') ;
  }
}

