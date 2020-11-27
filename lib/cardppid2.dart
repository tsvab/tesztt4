import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

//import 'package:http/http.dart' as http;
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

  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
    Tab(text: 'four'),
  ];

  Kiallito kiallito;

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
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {
        _tabIndex = _controller.index;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return ListView(children: <Widget>[
      Container(
        child: Column(
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
            tabbar1(),
            tabbarview2(),
            // Container(
            //   child: [
            //     Text('First tab'),
            //     Column(
            //       children: List.generate(40, (index) => Text('line: $index'))
            //           .toList(),
            //     ),
            //     Column(
            //       children: List.generate(60, (index) => Text('line: $index'))
            //           .toList(),
            //     ),
            //     Column(
            //       children: List.generate(20, (index) => Text('line: $index'))
            //           .toList(),
            //     ),
            //   ][_tabIndex],
            // ),
            cegnev(),
            //Container(child: Text('another component')),
          ],
        ),
      ),
    ]);
  }

  Widget logo() {
    return Center(
      child: Container(
        child: SizedBox(
          child: kiallito.urllogo == ''
              ? Container()
              : CachedNetworkImage(
                  imageUrl: kiallito.urllogo,
                  placeholder: (context, url) => Container(),
                  //errorWidget: (context, url, error) => Icon(Icons.error),
                  //width: 300,
                ),
        ),
        constraints: BoxConstraints(
            minHeight: 20,
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
      child: Center(
        child: Text(
          kiallito.cegnev,
          style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 1.5, fontWeightDelta: 2, color: Colors.black),
          // style: TextStyle(
          //     fontWeight: FontWeight.bold, fontSize: Font),
        ),
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
          style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 1, fontWeightDelta: 2, color: Colors.black),
          // style: TextStyle(
          //     fontWeight: FontWeight.bold, fontSize: Font),
        ),
      ),
    );
  }

  Widget kedvencekhez() {
    return RaisedButton(
      child: Text('Kedvencekhez'),
      onPressed: () {},
    );
  }

  Widget magunkrol() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          kiallito.magunkrol,
          style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: 1,
                fontWeightDelta: 1,
                color: Colors.black,
              ),
          // style: TextStyle(
          //     fontWeight: FontWeight.bold, fontSize: Font),
        ),
      ),
    );
  }

  Widget tabbar1() {
    return TabBar(
      controller: _controller,
      tabs: [
        Tab(
          child: Text(
            'Leírás',
            style: TextStyle(color: Colors.black),
          ),
          // icon: Icon(
          //   Icons.star,
          //   color: Colors.blue,
          // ),
        ),
        Tab(
          child: Text(
            'Kuponok',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Márkák',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Jegyzet',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget tabbarview2() {
    return Container(
      child: [
        magunkrol(),
        logo(),
        Column(
          children: List.generate(60, (index) => Text('line: $index')).toList(),
        ),
        Column(
          children: List.generate(20, (index) => Text('line: $index')).toList(),
        ),
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

  Widget tabbarview1() {
    return SingleChildScrollView(
      child: TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
            // width: 100,
            // height: 50,
            //color: Colors.amber[600],
            child: Column(
              children: [
                Text(
                  'Rólunk',
                  style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: 1.5,
                        fontWeightDelta: 2,
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.left,
                  // style: TextStyle(
                  //     fontWeight: FontWeight.bold, fontSize: Font),
                ),
                Container(
                  // width: 100,
                  // height: 50,
                  //color: Colors.amber[600],
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      kiallito.magunkrol,
                      style: DefaultTextStyle.of(context).style.apply(
                            fontSizeFactor: 1,
                            fontWeightDelta: 1,
                            color: Colors.black,
                          ),
                      // style: TextStyle(
                      //     fontWeight: FontWeight.bold, fontSize: Font),
                    ),
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
          Container(
            height: 70,
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text('Latitude: 48.09342\nLongitude: 11.23403'),
                trailing: IconButton(
                    icon: const Icon(Icons.my_location), onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
