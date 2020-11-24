import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class List1 extends StatelessWidget {
  final List _elements = [
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
    {'cegnev': 'John', 'group': 'Team A'},
    {'cegnev': 'Will', 'group': 'Team B'},
    {'cegnev': 'Beth', 'group': 'Team A'},
    {'cegnev': 'Miranda', 'group': 'Team B'},
    {'cegnev': 'Mike', 'group': 'Team C'},
    {'cegnev': 'Danny', 'group': 'Team C'},
  ];

  // Widget _buildGroupSeparator(dynamic groupByValue) {
  //   return Text('$groupByValue');
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        itemComparator: (item1, item2) =>
            item1['cegnev'].compareTo(item2['cegnev']),
        itemBuilder: (c, element) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Icon(Icons.account_circle),
                title: Text(element['cegnev']),
                trailing: Icon(Icons.arrow_forward),
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
  }
}
