import 'package:flutter/material.dart';
import '../models/time_entry.dart';

class TimeEntryWidget extends StatelessWidget {
  final TimeEntry entry;
  final VoidCallback onDelete;

  TimeEntryWidget({required this.entry, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('${entry.description}:', style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red
          )),
          Text('Duration: ${entry.duration} ${entry.duration > 1 ? "hours" : "hour"},', 
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
          Text('Date: ${entry.date}.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
          ElevatedButton(
            onPressed: onDelete,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            child: Text('X'),
          ),
        ],
      ),
    );
  }
}
