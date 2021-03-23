import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'dataset/dataset.dart';

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
