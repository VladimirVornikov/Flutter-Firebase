import 'package:flutter/material.dart';

@immutable
class TimeEntry {
  final String description;
  int duration;
  final String date;
  bool visible;

  TimeEntry({required this.description, 
  required this.duration,
  required this.date,
  this.visible = true});
}
