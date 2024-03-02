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
        title: Text('Time Tracking App', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeTrackingForm(addEntry: addEntry),
            SizedBox(height: 10),
            Text('Total Time: $totalTime hours'),
            SizedBox(height: 10),
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
      ),
    );
  }
}
