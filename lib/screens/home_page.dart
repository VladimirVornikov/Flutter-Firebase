import 'package:flutter/material.dart';
import 'package:time_tracker/firebase_storage_service.dart';
import '../models/time_entry.dart';
import '../widgets/time_entry_widget.dart';
import '../widgets/time_tracking_form.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalTime = 0;
  List<TimeEntry> originalEntries = [];
  List<TimeEntry> sortedEntries = [];
  String selectedFilter = '';

  void addEntry(TimeEntry entry) {
    setState(() {
      originalEntries.add(entry);
      uploadFile(originalEntries);
      sortBySelect(selectedFilter);
    });
  }

  void deleteActivity(int index) {
    setState(() {
      originalEntries.removeAt(index);
      sortBySelect(selectedFilter);
    });
  }

  void sortBySelect(selectedFilter) {
    List<TimeEntry> filteredEntries;
    
    switch (selectedFilter) {
      case 'Last week':
        filteredEntries = originalEntries.where((entry) => isWithinDuration(entry, 7)).toList();
        break;
      case 'Last month':
        filteredEntries = originalEntries.where((entry) => isWithinDuration(entry, 30)).toList();
        break;
      case 'Last year':
        filteredEntries = originalEntries.where((entry) => isWithinDuration(entry, 365)).toList();
        break;
      default:
        filteredEntries = List.from(originalEntries); 
    }

    filteredEntries.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));

    setState(() {
      sortedEntries = filteredEntries;
      totalTime = calculateTotalTime(sortedEntries);
    });
  }

  int calculateTotalTime(List<TimeEntry> entries) {
    return entries.fold(0, (total, entry) => total + entry.duration);
  }

  bool isWithinDuration(TimeEntry entry, int days) {
    DateTime entryDate = DateTime.parse(entry.date);
    DateTime now = DateTime.now();
    Duration difference = now.difference(entryDate);
    return difference.inDays <= days;
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
            DropdownButton<String>(
              value: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;
                  sortBySelect(selectedFilter);
                });
              },
              items: [
                DropdownMenuItem(value: '', child: Text('All time')),
                DropdownMenuItem(value: 'Last week', child: Text('Last week')),
                DropdownMenuItem(value: 'Last month', child: Text('Last month')),
                DropdownMenuItem(value: 'Last year', child: Text('Last year')),
              ],
            ),
            Text(
              'Entries:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: sortedEntries.length > 0 ? Colors.red : Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sortedEntries.length,
                itemBuilder: (context, index) => TimeEntryWidget(
                  entry: sortedEntries[index],
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