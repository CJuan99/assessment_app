import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardListTile extends StatelessWidget {
  final String user;
  final String phone;
  final String checkIn;
  //final String time;

  CardListTile({this.user, this.phone, this.checkIn});

  @override
  Widget build(BuildContext context) {
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
          vertical: 5.0,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // Text(
            //   time,
            //   style: TextStyle(color: Colors.black),
            // ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 10,
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
            SizedBox(
              width: 10,
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
