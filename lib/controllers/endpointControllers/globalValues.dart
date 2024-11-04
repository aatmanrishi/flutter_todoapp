// todo_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/Model/Model.dart';

const String todosCollectionName = 'todos';

final fstore = FirebaseFirestore.instance;

CollectionReference<Todo> todoCollectionReference =
    fstore.collection(todosCollectionName).withConverter<Todo>(
          fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
          toFirestore: (todo, _) => todo.toJson(),
        );
