import 'dart:math';

import 'package:flutter/material.dart';

//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _random = new Random();
//   var data = [
//     'T 0',
//     'T 1',
//     'T 2',
//     'T 3',
//     'T 4',
//     'T 5',
//     'T 6',
//     'T 7',
//     'T 8',
//     'T 9',
//     'T 10',
//     'T 11',
//     'T 12',
//     'T 13',
//     'T 14',
//     'T 15',
//     'T 16',
//     'T 17',
//     'T 18',
//     'T 19',
//   ];
//
//   var listToShow = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Container(
//           height: 75,
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               IconButton(
//                 iconSize: 30.0,
//                 padding: EdgeInsets.only(left: 28.0),
//                 icon: Icon(Icons.refresh),
//                 onPressed: () {
//                   setState(() {
//                     updateDataInList();
//                   });
//                 },
//               ),
//               IconButton(
//                 iconSize: 30.0,
//                 padding: EdgeInsets.only(right: 28.0),
//                 icon: Icon(Icons.all_inclusive),
//                 onPressed: () {
//                   setState(() {
//                     showAllData();
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: listToShow.length,
//         itemBuilder: (context, i) {
//           return Ink(
//             color: Colors.blueGrey,
//             child: ListTile(
//               title: Text(listToShow[i].toString()),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void updateDataInList() {
//     // listToShow =
//     //new List.generate(10, (_) => data[_random.nextInt(data.length)]);
//     listToShow = new List.generate(2, (_) => data[_random.nextInt(data.length)])
//         .toSet()
//         .toList();
//   }
//
//   void showAllData() {
//     listToShow = data;
//   }
// }

class Model {
  final DateTime date;
  final String text;

  Model({this.date, this.text});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Populate initial value for the list of models
  List<Model> _models = [
    Model(
      date: DateTime(2018, 9, 1),
      text: 'Text1',
    ),
    Model(
      date: DateTime(2018, 9, 1),
      text: 'Text2',
    ),
    Model(
      date: DateTime(2018, 9, 2),
      text: 'Text3',
    ),
    Model(
      date: DateTime(2018, 9, 3),
      text: 'Text4',
    ),
    Model(
      date: DateTime(2018, 8, 31),
      text: 'Text7',
    ),
    Model(
      date: DateTime(2018, 9, 3),
      text: 'Text5',
    ),
    Model(
      date: DateTime(2018, 9, 3),
      text: 'Text6',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          setState(() {
            // On click of floating action button, add a hardcoded item to _models list
            _models.add(Model(
              date: DateTime(2018, 9, 2),
              text: 'New Item',
            ));
          });
        },
      ),
      body: SortedGroupedList(_models),
    );
  }
}

class SortedGroupedList extends StatefulWidget {
  final List<Model> list;
  SortedGroupedList(this.list);

  @override
  State<StatefulWidget> createState() => _SortedGroupedListState();
}

class _SortedGroupedListState extends State<SortedGroupedList> {
  List<Model> _list;
  @override
  void initState() {
    super.initState();
    _list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    _list.sort((a, b) => b.date.compareTo(a.date));
    Model prev;
    bool shownHeader = false;

    List<Widget> _listChildren = <Widget>[];
    _list.forEach((Model model) {
      if (prev != null && model.date != prev.date) {
        shownHeader =
            false; // if dates are different, beginning of a new group, so header is yet to be shown
      }

      if (!shownHeader) {
        // if header for a group is not shown yet, add it to the list
        _listChildren.add(ListTile(
            title: Text(
          model.date.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        )));
        prev =
            model; // keep the current model for reference to check if group has changed
        shownHeader = true;
      }

      _listChildren.add(ListTile(title: Text(model.text)));
    });

    return ListView(children: _listChildren);
  }
}
