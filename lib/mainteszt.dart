import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderDetails(),
    );
  }
}

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
    Tab(text: 'four'),
  ];

  TabController _tabController;
  int _tabIndex = 0;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detials'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        // padding: EdgeInsets.all(15),
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.yellow,
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.redAccent,
                  tabs: myTabs,
                ),
                Container(
                  child: [
                    Text('First tab'),
                    Column(
                      children:
                          List.generate(40, (index) => Text('line: $index'))
                              .toList(),
                    ),
                    Column(
                      children:
                          List.generate(60, (index) => Text('line: $index'))
                              .toList(),
                    ),
                    Column(
                      children:
                          List.generate(20, (index) => Text('line: $index'))
                              .toList(),
                    ),
                  ][_tabIndex],
                ),
              ],
            ),
          ),
          Container(child: Text('another component')),
        ],
      ),
    );
  }
}
