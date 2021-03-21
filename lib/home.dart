import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _random = new Random();
  var data = [
    'T 0',
    'T 1',
    'T 2',
    'T 3',
    'T 4',
    'T 5',
    'T 6',
    'T 7',
    'T 8',
    'T 9',
    'T 10',
    'T 11',
    'T 12',
    'T 13',
    'T 14',
    'T 15',
    'T 16',
    'T 17',
    'T 18',
    'T 19',
  ];

  var listToShow = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    updateDataInList();
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.all_inclusive),
                onPressed: () {
                  setState(() {
                    showAllData();
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listToShow.length,
        itemBuilder: (context, i) {
          return Ink(
            color: Colors.blueGrey,
            child: ListTile(
              title: Text(listToShow[i].toString()),
            ),
          );
        },
      ),
    );
  }

  void updateDataInList() {
    // listToShow =
    //new List.generate(10, (_) => data[_random.nextInt(data.length)]);
    listToShow = new List.generate(2, (_) => data[_random.nextInt(data.length)])
        .toSet()
        .toList();
  }

  void showAllData() {
    listToShow = data;
  }
}
