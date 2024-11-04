import 'package:todo_app/Model/Model.dart';
import 'globalValues.dart';

  Future<void> updateTodo(String id, Todo todo) async {
    await todoCollectionReference.doc(id).set(todo);
  }