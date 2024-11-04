import 'globalValues.dart';

  Future<void> deleteTodo(String id) async {
    await todoCollectionReference.doc(id).delete();
  }