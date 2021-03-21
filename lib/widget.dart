import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardListTile extends StatelessWidget {
  final String user;
  final String phone;
  final String checkIn;
  //final String time;

  CardListTile({this.user, this.phone, this.checkIn});

  @override
  Widget build(BuildContext context) {
    var time = timeAgoSinceDate(checkIn);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: Colors.orange,
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              timeAgoSinceDate(checkIn),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.phone,
              color: Colors.yellow,
            ),
            Text(
              phone,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.calendar_today_rounded,
              color: Colors.yellow,
            ),
            Text(
              checkIn,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
  DateTime notificationDate =
      DateFormat("yyyy-MM-dd h:mm:ss").parse(dateString);
  final date2 = DateTime.parse("2020-08-24 00:00:04Z");
  final difference = date2.difference(notificationDate);

  if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
