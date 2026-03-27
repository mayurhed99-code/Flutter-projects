import 'package:flutter/material.dart';

class NotificationService {
  NotificationService._();

  static void show(BuildContext context, String title, String body) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$title: $body')));
  }
}
