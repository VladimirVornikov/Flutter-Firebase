import 'package:flutter/material.dart';
import '../models/time_entry.dart';
import '../widgets/time_entry_widget.dart';
import '../widgets/time_tracking_form.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalTime = 0;
  List<TimeEntry> entries = [];

  void addEntry(TimeEntry entry) {
    setState(() {
      totalTime += entry.duration;
      entries.add(entry);
    });
  }

  void deleteActivity(int index) {
    setState(() {
      totalTime -= entries[index].duration;
      entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracking App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeTrackingForm(addEntry: addEntry),
          Text('Total Time: $totalTime hours'),
          Text('Entries:'),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) => TimeEntryWidget(
                entry: entries[index],
                onDelete: () => deleteActivity(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
