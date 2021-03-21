import 'dart:math';
import 'package:flutter/material.dart';
import 'package:assessment_app/widget.dart';
import 'dataset/dataset.dart';
import 'package:assessment_app/dataset/dataset.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Random rnd = new Random();
  ScrollController _controller;
  var listToShow = [];

  @override
  void initState() {
    updateDataInList();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  // void generateRandom() {
  //   setState(() {
  //     contact.shuffle();
  //   });
  // }

  String _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(
            "End of list",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text("Okay"),
              onPressed: () {
                print('Okay');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _scrollListener() {
    final _scrollThreshold = 200.0;
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _showDialog();
      });
    }

    if (_controller.position.extentAfter < _scrollThreshold) {
      setState(() {
        showAllData();
      });
    }
  }

  void updateDataInList() {
    listToShow =
        new List.generate(5, (_) => contact[rnd.nextInt(contact.length)]);

    // listToShow =
    //     new List.generate(6, (_) => contact[rnd.nextInt(contact.length)])
    //         .toSet()
    //         .toList();
  }

  void showAllData() {
    listToShow = contact;
  }

  Future<List<Contact>> refreshContact() async {
    setState(() {
      updateDataInList();
      contact.shuffle();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Contact'),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          controller: _controller,
          itemCount: listToShow.length,
          itemBuilder: (context, index) => CardListTile(
            user: contact[index].user,
            phone: contact[index].phone,
            checkIn: contact[index].checkIn,
          ),
        ),
        onRefresh: refreshContact,
      ),
    );
  }
}
