import 'package:flutter/material.dart';

enum NotificationType { accepted, offer, finished }

class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String date;
  final String avatar;
  final NotificationType type;
  final bool hasAction;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.avatar,
    required this.type,
    this.hasAction = false,
  });
}
