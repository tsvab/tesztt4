import 'package:flutter/material.dart';

class TesztTab1 extends StatefulWidget {
  @override
  _TesztTab1State createState() => _TesztTab1State();
}

class _TesztTab1State extends State<TesztTab1>
    with SingleTickerProviderStateMixin {
  TabController _controller;

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageTeszt'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('eleje'),
            tabbar1(),
            tabbarview2(),
            Text('vége'),
          ],
        ),
      ),
    );
  }

  Widget tabbar1() {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: TabBar(
        controller: _controller,
        indicatorColor: Colors.black,
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
      ),
    );
  }

  Widget tabbarview2() {
    return Expanded(
      child: Container(
        color: Colors.green,
        child: TabBarView(controller: _controller, children: <Widget>[
          Text('11111111111'),
          Text('222222222222'),
        ]),
      ),
    );
  }
}
