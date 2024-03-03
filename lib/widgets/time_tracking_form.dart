import 'package:flutter/material.dart';
import '../models/time_entry.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';


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
  late String formattedDate;

  _TimeTrackingFormState() {
    description = '';
    duration = '';
    userDate = '';
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: description,
            onChanged: (value) {
              setState(() {
                description = value!;
              });
            },
            items: [
              DropdownMenuItem(value: '', child: Text('Choose your activity')),
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
            decoration: InputDecoration(labelText: 'Duration (hours 1-24)'),
          ),

          DateTimePicker(
            initialValue: userDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.parse(formattedDate),
            dateLabelText: 'Date',
            onChanged: (value) {
              setState(() {
                userDate = value;
              });
            },
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),

          Padding(padding: 
            EdgeInsets.only(top: 10, bottom: 10)),

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
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
          ),
        ],
      ),
    );
  }
}
