import 'package:flutter/material.dart';

@immutable
class TimeEntry {
  final String description;
  final int duration;
  final String date;

  TimeEntry({required this.description, required this.duration, required this.date});
}
