import 'package:todo_app/Model/Model.dart';
import 'package:todo_app/controllers/endpointControllers/globalValues.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getAllData() async {
  // Fetch the snapshot from the Firestore collection
  QuerySnapshot<Todo> snapshot = await todoCollectionReference.get();

  // Map the documents to a list of Maps with objId and data
  List<Map<String, dynamic>> todoList = snapshot.docs.map((doc) {
    return {
      'objId': doc.id,    // Get the document ID
      'data': doc.data(), // Get the Todo data
    };
  }).toList();

  return todoList; // Return the list
}
