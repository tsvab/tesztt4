import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//import 'package:http/http.dart' as http;
import 'calendarmodal1.dart';
import 'calendarmodalcupertino1.dart';
import 'kiallito1.dart';

class CardPpid2 extends StatefulWidget {
  final String ppid;
//  CardPpid2({Key key, @required this.recordObject}) : super(key: key);
  CardPpid2({Key key, this.ppid}) : super(key: key);

  @override
  _CardPpid2State createState() => _CardPpid2State();
}

class _CardPpid2State extends State<CardPpid2>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _tabIndex = 0;

  Kiallito kiallito;

  TextStyle _textStylePlain;
  TextStyle _textStyleHeading;

  Future<bool> getKiallito(ppid) async {
    // Future<void> getKiallito() async {
    await fetchKiallito(ppid).then((value) {
      kiallito = value;
      // print('getKiallito kiallito: $kiallito');
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    print('_controller.index: ${_controller.index}');
    //if (_controller.indexIsChanging) {
    setState(() {
      _tabIndex = _controller.index;
    });
    //}
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textStyleHeading = DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: 1.5,
          fontWeightDelta: 2,
          color: Colors.black,
        );

    _textStylePlain = DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: 1,
          fontWeightDelta: 1,
          color: Colors.black,
        );
    return FutureBuilder(
        future: getKiallito(widget.ppid),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          //print('kiallito: $kiallito');
          if (snapshot.hasData) {
            //return Text(kiallito.cegnev);
            return cardppid2();
          } else {
            //return Container();
            return Container(
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

  //https://stackoverflow.com/questions/54642710/tabbarview-with-dynamic-container-height

  Widget cardppid2() {
    return GestureDetector(
      onHorizontalDragEnd: (dragEndDetails) {
        if (dragEndDetails.primaryVelocity < 0) {
          if (_controller.index < _controller.length - 1) {
            _controller.index += 1;
          }
        } else if (dragEndDetails.primaryVelocity > 0) {
          if (_controller.index > 0) {
            _controller.index -= 1;
          }
        }
      },
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.yellow,
            // ),
            logo(),
            cegnev(),
            helylist(),
            kedvencekhez(),
            // TabBar(
            //   controller: _controller,
            //   labelColor: Colors.redAccent,
            //   tabs: myTabs,
            // ),

            tab1(),
            // tabbar1(),
            // tabbarview2(),

            //tab2(),

            Text(
                '.. és itt jön a folytatás, ami jól kapcsolódik, függ a felette lévők méretétől :-))))'),
            //cegnev(),
            //Container(child: Text('another component')),
          ],
        ),
      ]),
    );
  }

  Widget logo() {
    /// TODO Hero
    return Center(
      child: Container(
        child: SizedBox(
          child: kiallito.urllogo == ''
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: kiallito.urllogo,
                    placeholder: (context, url) => Container(),
                    //errorWidget: (context, url, error) => Icon(Icons.error),
                    //width: 300,
                  ),
                ),
        ),
        constraints: BoxConstraints(
            minHeight: 0,
            // minWidth: double.infinity,
            // maxWidth: 300,
            maxHeight: 150),
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }

  Widget cegnev() {
    return Container(
      // width: 100,
      // height: 50,
      //color: Colors.amber[600],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            /// DONE hosszú cégnév több sorba törik
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  kiallito.cegnev,
                  maxLines: 2,
                  softWrap: true,
                  //overflow: TextOverflow.fade,
                  style: DefaultTextStyle.of(context).style.apply(
                      fontSizeFactor: 1.5,
                      fontWeightDelta: 2,
                      color: Colors.black),
                  // style: TextStyle(
                  //     fontWeight: FontWeight.bold, fontSize: Font),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget helylist() {
    return Container(
      // width: 100,
      // height: 50,
      //color: Colors.amber[600],
      child: Center(
        child: Text(
          kiallito.helylist,
          style: _textStylePlain,
          // style: DefaultTextStyle.of(context).style.apply(
          //     fontSizeFactor: 1, fontWeightDelta: 2, color: Colors.black),
          // style: TextStyle(
          //     fontWeight: FontWeight.bold, fontSize: Font),
        ),
      ),
    );
  }

  Widget kedvencekhez() {
    return RaisedButton(
      child: Text('Kedvencekhez'),
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Hozzáadva a kedvencekhez!'),
          // action: SnackBarAction(
          //   label: 'Undo',
          //   onPressed: () {
          //     // Some code to undo the change.
          //   },
          // ),
          duration: Duration(seconds: 2),
        );

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }

  Widget magunkrol() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text(
            "Rólunk",
            style: _textStyleHeading,
          ),
        ),
        // Text(
        //   kiallito.magunkrol,
        //   style: _textStylePlain,
        //
        //   /// DONE text justify
        //   textAlign: TextAlign.justify,
        // ),
        ExpandText(
          kiallito.magunkrol,
          textAlign: TextAlign.justify,
          maxLines: 3,
          expandOnGesture: false,
        ),
      ]),
    );
  }

  Widget terkep() {
    /// TODO itt áll ön külön layer-en
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(
              'Hol talál meg minket?',
              style: _textStyleHeading,
            ),
          ),
          Image.network(
              'https://eregistrator.hu/upload/profil1/0015837634573.jpg'),
        ],
      ),
    );
  }

  Widget info() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(
              "További információk",
              style: _textStyleHeading,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.widgets_outlined),
                title: Text(
                  kiallito.katagorialist,
                  style: _textStylePlain,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              kiallito.email,
              style: _textStylePlain,
            ),
          ),
          ListTile(
            leading: Icon(Icons.web_asset),
            title: Text(
              kiallito.web,
              style: _textStylePlain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_pin),
                  ],
                ),
                title: Text(
                  /// TODO: php telefon-t le kell választani, hogy külön mezőben legyen
                  /// TODO: telefonszámra kattintással tárcsázza a számot
                  kiallito.kapcsolat,
                  style: _textStylePlain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget markak1() {
    return Container(
      /// TODO: ide még kell javítás, vmi más technológia a direkt magasság kiküszöbölésére
      color: Colors.yellow,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kiallito.markalista.length,
        //itemCount: 5,
        itemBuilder: (c, index) {
          //index = 0;
          //return Text('AAAAAB ');
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      //color: Colors.red,
                      )),
              child: Column(
                children: [
                  ListTile(
                    horizontalTitleGap: 10,
                    // leading: CircleAvatar(
                    //   child: Text('CA'),
                    // ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Text(kiallito.markalista[index]['urllogomarka']),
                        Container(
                          height: 100,
                          child: kiallito.markalista[index]['urllogomarka'] ==
                                  ''
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: kiallito.markalista[index]
                                        ['urllogomarka'],
                                    placeholder: (context, url) => Container(),
                                    //errorWidget: (context, url, error) => Icon(Icons.error),
                                    //width: 300,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    subtitle: Center(
                      child: Text(
                        //'asdasd $i',
                        kiallito.markalista[index]['nev1'],
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    // return Container(
    //     height: 50,
    //     color: Colors.yellow,
    //     child: ListView.builder(
    //       //scrollDirection: Axis.horizontal,
    //       itemCount: 5,
    //       itemBuilder: (c, i) {
    //         return Column(
    //           // height: 30,
    //           // width: 30,
    //           // decoration: BoxDecoration(
    //           //     border: Border.all(
    //           //         //color: Colors.black,
    //           //         )),
    //           //color: Colors.blue,
    //           children: [
    //             ListTile(
    //               //horizontalTitleGap: 10,
    //               title: Text(
    //                 'SSS',
    //                 style: TextStyle(color: Colors.green),
    //               ),
    //             ),
    //           ],
    //         );
    //       },
    //     ));

    // return Container(
    //   //height: 100,
    //   child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    //     ListView.builder(
    //       scrollDirection: Axis.horizontal,
    //       itemCount: 3,
    //       itemBuilder: (c, index) {
    //         return Container(
    //           height: 50,
    //           width: 50,
    //           color: Colors.yellow,
    //           // child: Text('wefwefqwf')
    //         );
    //       },
    //     )
    //   ]),
    // );

    //   return ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 3,
    //     itemBuilder: (BuildContext ctxt, int index) {
    //       return Container(
    //         width: 80,
    //         height: 80,
    //         child: ListTile(
    //           horizontalTitleGap: 5,
    //
    //           title: Text('asadsasd'),
    //         ),
    //       );
    //     },
    //   // );
  }

  Widget marka() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(
              "Forgalmazott márkák",
              style: _textStyleHeading,
            ),
          ),
          markak1(),
          //Text('Márka vége QQQQQQQQQQQQQQ'),
        ],
      ),
    );
  }

  Widget calendar1() {
    /// TODO x close button
    return Column(
      children: [
        RaisedButton(
          child: Text('Foglalás Cupertino'),
          onPressed: () {
            return showCupertinoModalBottomSheet(
              expand: false,
              enableDrag: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => CalendarModalCupertino1(),
            );
          },
        ),
        RaisedButton(
          child: Text('Foglalás'),
          onPressed: () {
            return showMaterialModalBottomSheet(
              expand: false,
              enableDrag: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => CalendarModal1(),
            );
          },
        ),
      ],
    );
  }

  Widget tab1() {
    return Column(children: [
      tabbar1(),
      tabbarview2(),
    ]);
  }

  // Widget tab2() {
  //   return DefaultTabController(
  //     length: 4,
  //     child: Column(children: [
  //       tabbar1(),
  //       tabbarview3(),
  //     ]),
  //   );
  // }

  Widget tabbar1() {
    return TabBar(
      controller: _controller,
      isScrollable: true,
      tabs: [
        Tab(
          child: Text(
            'Leírás',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          // icon: Icon(
          //   Icons.star,
          //   color: Colors.blue,
          // ),
        ),
        Tab(
          child: Text(
            'Kuponok',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            'Újdonságok',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            'Jegyzet',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            'Időpont foglalás',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget tabbarview3() {
    return Expanded(
      //height: 400,
      child: TabBarView(
        children: [
          Container(
            child: Column(
              children: [
                magunkrol(),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                terkep(),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                info(),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                marka(),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          // Container(height: 100, child: Text('rólunk')),
          // Container(height: 100, child: Text('rólunk')),
          // Container(height: 100, child: Text('rólunk')),
          // Container(height: 100, child: Text('rólunk')),
          Text('kuponok'),
          Text('újdonság'),
          Text('jegyzet'),
          Text('időpont foglalás'),
        ],
      ),
    );
  }

  Widget tabbarview2() {
    return Container(
      child: [
        Column(
          children: [
            magunkrol(),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            terkep(),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            info(),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            marka(),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        //      children:
        // ),
        Text('kuponok'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              List.generate(20, (index) => Text('blabla: $index')).toList(),
        ),
        Text('jegyzet'),
        calendar1(),
      ][_tabIndex],
    );
  }

  // Widget tabbarview3() {
  //   return Container(
  //     controller: _controller,
  //     children: <Widget>[
  //       Text('1'),
  //       Text('2'),
  //     ],
  //   );
  // }

//   Widget tabbarview1() {
//     return SingleChildScrollView(
//       child: TabBarView(
//         controller: _controller,
//         children: <Widget>[
//           Container(
//             // width: 100,
//             // height: 50,
//             //color: Colors.amber[600],
//             child: Column(
//               children: [
//                 Text(
//                   'Rólunk',
//                   style: _textStyleHeading,
//                   textAlign: TextAlign.left,
//                   // style: TextStyle(
//                   //     fontWeight: FontWeight.bold, fontSize: Font),
//                 ),
//                 Container(
//                   // width: 100,
//                   // height: 50,
//                   //color: Colors.amber[600],
//                   padding: const EdgeInsets.all(10.0),
//                   child: Center(
//                     child: Text(
//                       kiallito.magunkrol,
//                       style: _textStylePlain,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//           ),
//           Container(
//             height: 70,
//             child: Card(
//               child: ListTile(
//                 leading: const Icon(Icons.location_on),
//                 title: Text('Latitude: 48.09342\nLongitude: 11.23403'),
//                 trailing: IconButton(
//                     icon: const Icon(Icons.my_location), onPressed: () {}),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
