import 'package:todo_app/Model/Model.dart';

import 'globalValues.dart';

Future<void> addTodo(Todo todo) async {
  print('You have benne reached to add Function');
  await todoCollectionReference.add(todo);
}
