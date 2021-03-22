import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'dataset/dataset.dart';

// class CardListTile extends StatelessWidget {
//   final String user;
//   final String phone;
//   final String checkIn;
//   //final String time;
//
//   CardListTile({this.user, this.phone, this.checkIn});
//
//   @override
//   Widget build(BuildContext context) {
//     var time = timeAgoSinceDate(checkIn);
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5),
//         ),
//       ),
//       color: Colors.orange,
//       elevation: 8.0,
//       margin: new EdgeInsets.symmetric(
//         horizontal: 10.0,
//         vertical: 10.0,
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 20.0,
//           vertical: 15.0,
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               user,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               timeAgoSinceDate(checkIn),
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         subtitle: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               Icons.phone,
//               color: Colors.yellow,
//             ),
//             Text(
//               phone,
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Icon(
//               Icons.calendar_today_rounded,
//               color: Colors.yellow,
//             ),
//             Text(
//               checkIn,
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             IconButton(
//                 icon: Icon(Icons.share),
//                 onPressed: () {
//                   share(context);
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }

String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
  DateTime notificationDate = DateTime.parse(dateString);
  final date2 = DateTime.parse("2020-08-23 00:00:04Z");
  final diff = date2.difference(notificationDate);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day(s) ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour(s) ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute(s) ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second(s) ago';
  } else {
    return 'just now';
  }
}

void share(BuildContext context, Contact contact) {
  final String text =
      'User: ${contact.user}, Phone: ${contact.phone}, Check-In:${contact.checkIn}';
  Share.share(text, subject: 'Contact Info');
}
//
// // class SortedList extends StatefulWidget {
// //   final List<Contact> list;
// //   SortedGroupedList(this.list);
// //   @override
// //   _SortedListState createState() => _SortedListState();
// // }
// //
// // class _SortedListState extends State<SortedList> {
// //   List<Contact> list;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }
