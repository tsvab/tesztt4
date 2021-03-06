import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

//import 'package:http/http.dart' as http;
import 'kiallito1.dart';

class CardPpid1 extends StatefulWidget {
  final String ppid;
//  CardPpid1({Key key, @required this.recordObject}) : super(key: key);
  CardPpid1({Key key, this.ppid}) : super(key: key);

  @override
  _CardPpid1State createState() => _CardPpid1State();
}

class _CardPpid1State extends State<CardPpid1>
    with SingleTickerProviderStateMixin {
  TabController _controller;

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
    _controller = new TabController(length: 2, vsync: this);
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
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        //scrollDirection: Axis.vertical,
        color: Colors.yellow,
        padding: new EdgeInsets.all(7.0),
        child: Column(
          children: [
            logo(),
            cegnev(),
            helylist(),
            kedvencekhez(),
            //tabbar5(),
            tabbar1(),
            //tabbarview2(),
            logo(),
            cegnev(),
            logo(),
            cegnev(),
            logo(),
            cegnev(),
            logo(),
            cegnev(),
          ],
        ),
        //     //width: MediaQuery.of(context).size.width,
        //     // height: MediaQuery.of(context).size.height,
        //     color: Colors.yellow,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       //mainAxisSize: MainAxisSize.min,
        //       //mainAxisAlignment: MainAxisAlignment.center,
        //       children: [Expanded(
        //         child: Column(
        //           children: [
        //             [
        //               logo(),
        //               cegnev(),
        //               helylist(),
        //               kedvencekhez(),
        //               tabbar1(),
        //               tabbarview1(),
        //               // tabbarview2(),
        //               // logo(),
        //               // cegnev(),
        //               // helylist(),
        //               // logo(),
        //               //cegnev(),
        //               // helylist(),
        //             ],
        //           ],
        //           ),
        //           ),
        // ],
        //           ),
      ),
    );
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

  Widget tabbar5() {
    //return Text('sddaasd');
    return Column(
      children: [
        //Text('sddaasd'),
        tabbar1(),
        tabbarview2(),
      ],
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
      ],
    );
  }

  Widget tabbarview2() {
    return Container(
      //height: 100,
      child: TabBarView(
        controller: _controller,
        children: <Widget>[
          Text('1'),
          Text('2'),
        ],
      ),
    );
  }

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
