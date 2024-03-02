import 'package:flutter/material.dart';
import '../models/time_entry.dart';

class TimeTrackingForm extends StatefulWidget {
  final Function(TimeEntry) addEntry;

  TimeTrackingForm({required this.addEntry});

  @override
  _TimeTrackingFormState createState() => _TimeTrackingFormState();
}

class _TimeTrackingFormState extends State<TimeTrackingForm> {
  late String description;
  late String duration;
  late String userDate;

  _TimeTrackingFormState() {
    description = '';
    duration = '';
    userDate = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: description,
            onChanged: (value) {
              setState(() {
                description = value!;
              });
            },
            items: [
              DropdownMenuItem(value: '', child: Text('by default')),
              DropdownMenuItem(value: 'Work', child: Text('Work')),
              DropdownMenuItem(value: 'Study', child: Text('Study')),
              DropdownMenuItem(value: 'Free time', child: Text('Free time')),
              DropdownMenuItem(value: 'Chores', child: Text('Chores')),
              DropdownMenuItem(value: 'Sleep', child: Text('Sleep')),
            ],
          ),
          TextFormField(
            initialValue: duration,
            onChanged: (value) {
              setState(() {
                duration = value;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Duration (hours)'),
          ),
          TextFormField(
            initialValue: userDate,
            onChanged: (value) {
              setState(() {
                userDate = value;
              });
            },
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(labelText: 'Date'),
          ),
          ElevatedButton(
            onPressed: () {
              if (description.isNotEmpty && duration.isNotEmpty && userDate.isNotEmpty) {
                final entry = TimeEntry(
                  description: description,
                  duration: int.parse(duration),
                  date: userDate,
                );
                widget.addEntry(entry);
                setState(() {
                  description = '';
                });
              }
            },
            child: Text('Add Entry'),
          ),
        ],
      ),
    );
  }
}
