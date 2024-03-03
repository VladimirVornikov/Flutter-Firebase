import 'package:flutter/material.dart';
import '../models/time_entry.dart';

class TimeEntryWidget extends StatefulWidget {
  final TimeEntry entry;
  final VoidCallback onDelete;

  TimeEntryWidget({required this.entry, required this.onDelete});

  @override
  _TimeEntryWidgetState createState() => _TimeEntryWidgetState();
}

class _TimeEntryWidgetState extends State<TimeEntryWidget> {
  TextEditingController _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _durationController.text = widget.entry.duration.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      child: Column(
        children: [
          Text(
            '${widget.entry.description}:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          GestureDetector(
            onTap: () {
              _editDuration(context);
            },
            child: Text(
              'Duration: ${widget.entry.duration} ${widget.entry.duration > 1 ? "hours" : "hour"},',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Text(
            'Date: ${widget.entry.date}.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          ElevatedButton(
            onPressed: widget.onDelete,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('X'),
          ),
        ],
      ),
    );
  }

  void _editDuration(BuildContext context) async {
    final newDuration = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Duration'),
          content: TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Duration'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(int.tryParse(_durationController.text) ?? 0);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (newDuration != null) {
      setState(() {
        widget.entry.duration = newDuration;
      });
    }
  }
}
