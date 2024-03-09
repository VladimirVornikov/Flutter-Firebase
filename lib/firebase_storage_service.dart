import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadFile(List<dynamic> arrayToAdd) async {
  try {
    final jsonString = jsonEncode(arrayToAdd);

    final List<int> bytes = utf8.encode(jsonString);

    final Uint8List data = Uint8List.fromList(bytes);

    final ref = firebase_storage.FirebaseStorage.instance
        .ref('gs://timetracker-83156.appspot.com/Project1/data.json');

    await ref.putData(data);

    print('File uploaded successfully');
  } catch (e) {
    print('Error uploading file: $e');
  }
}
