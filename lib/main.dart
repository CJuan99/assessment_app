// import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:assessment_app/widget.dart';
import 'dataset/dataset.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:assessment_app/dataset/dataset.dart';

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
  var currentTime = DateTime.parse("2020-07-20 20:18:04Z");
  //var time

  void initState() {
    super.initState();
    generateRandom();
  }

  void generateRandom() {
    setState(() {
      contact.shuffle();
    });
  }

  Random rnd = new Random();

  Future<List<Contact>> refreshContact() async {
    setState(() {
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
          itemCount: 5,
          itemBuilder: (context, index) => CardListTile(
            user: contact[index].user,
            phone: contact[index].phone,
            checkIn: contact[index].checkIn,
          ),
        ),
        //),
        // Expanded(
        //   // flex: 1,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       ElevatedButton(
        //         child: Text('Shuffle Cards'),
        //         onPressed: () {
        //           //TODO: Shuffle all cards and change the order of them in the UI
        //           contact.shuffle();
        //           setState(() {});
        //         },
        //       )
        //     ],
        //   ),
        // )
        onRefresh: refreshContact,
      ),
    );
  }
}
// body: ListView.builder(itemBuilder: (context, index) {
//   return Card(
//     child: Padding(
//         padding:
//             EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('User: ',
//                 style:
//                     TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Text('Phone',
//                 style:
//                     TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Text('Check-in',
//                 style:
//                     TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ],
//         )),
//   );
// }),
//     );
//   }
// }
