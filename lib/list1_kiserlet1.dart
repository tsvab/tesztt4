import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'kiallito1.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Kiallito {
  final String cegnev1;
  final bool favourite;

  Kiallito(this.cegnev1, {this.favourite = false});
}

class List1 extends StatefulWidget {
  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  List<Kiallito> kiallitoList = [];
  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  List<String> strList = [];

  List<dynamic> _elements;

  Future<bool> getKiallitok() async {
    await fetchKiallito().then((value) {
//print(value);
//           if (mounted) {
//             setState(() => {_elements = value});
//          _elements = value;
//          kiallitoList[] = Kiallito( value['name'] );
//               _elements.add( name: value['name'], group: value['group'] ) ;
//print("elements 1 : $_elements");
      value.forEach((element) {
//print( element['name'] );
        kiallitoList.add(Kiallito(element['name']));
      });
//print('kiallitoList: $kiallitoList') ;
      kiallitoList.sort(
          (a, b) => a.cegnev1.toLowerCase().compareTo(b.cegnev1.toLowerCase()));
    });
    return true;
  }

  Future<bool> FilteredList() async {
    await getKiallitok().then((value) {
      print('kiallitoList: $kiallitoList');
    });
    strList = [];
    strList.add('Márió');
    normalList.add(
      Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.1,
        secondaryActions: <Widget>[
          IconSlideAction(
            iconWidget: Icon(Icons.star),
            onTap: () {},
          ),
          IconSlideAction(
            iconWidget: Icon(Icons.more_horiz),
            onTap: () {},
          ),
        ],
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("http://placeimg.com/200/200/people"),
          ),
          title: Text('Tamás'),
          subtitle: Text('kezdő'),
        ),
      ),
    );
    print('strList: $strList');
    strList.add('Tamás');
    return true;
  }

  @override
  void initState() {
    super.initState();

//print('getKiallitok elott');

//    FilteredList() ;
    print('getKiallitok utan');
//print('ssss');
    //
    // for (var i = 0; i < 100; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), false));
    // }
    // for (var i = 0; i < 4; i++) {
    //   var name = faker.person.name();
    //   userList.add(User(name, faker.company.name(), true));
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return Text('s222222Q') ;
    return FutureBuilder(
        future: FilteredList(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return AlphabetListScrollView(
              strList: strList,
              highlightTextStyle: TextStyle(
                color: Colors.yellow,
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
                          // controller: searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffix: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            labelText: "Searchrrrr",
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
            );
          } else {
            return Text('data2');
          }
        });
  }
}
