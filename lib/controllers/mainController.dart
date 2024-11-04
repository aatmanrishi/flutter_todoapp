import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Model/Model.dart';
import 'package:todo_app/controllers/endpointControllers/EditFunction.dart';
import 'package:todo_app/controllers/endpointControllers/addFunction.dart';
import 'package:todo_app/controllers/endpointControllers/getAlldataFunction.dart';

class CrudController extends GetxController {
  RxBool loader = false.obs;
  RxList<Map<String, dynamic>> todoList = <Map<String, dynamic>>[].obs;
  TextEditingController taskController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await gettingTodo();
  }

  Future<void> gettingTodo() async {
    loader.value = true;
    try {
      todoList.clear();
      todoList.value = await getAllData();
      print(todoList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch todos: ${e.toString()}');
    } finally {
      loader.value = false;
    }
  }

  Future<void> addingTodo() async {
    final taskText = taskController.text.trim();
    if (taskText.isEmpty) {
      Get.snackbar('Error', 'Task cannot be empty!');
      return;
    }

    loader.value = true;
    try {
      Todo todo = Todo(
        todoTask: taskText,
        isChecked: false,
        createdTimeStamp: DateTime.now(),
        updatedTimeStamp: null,
      );
      taskController.clear();
      await addTodo(todo);
      Get.snackbar('Success', 'Todo added successfully!');
      await gettingTodo();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add todo: ${e.toString()}');
    } finally {
      loader.value = false;
    }
  }

  Future<void> editingTodoName(
      {String? objId,
      bool? isChecked,
      DateTime? createdDateTime,
      DateTime? updatedTime}) async {
    final taskText = taskController.text;
    if (taskText.isEmpty) {
      Get.snackbar('Error', 'Task cannot be empty!');
      return;
    }

    loader.value = true;
    try {
      Todo todo = Todo(
        todoTask: taskText,
        isChecked: isChecked,
        createdTimeStamp: createdDateTime,
        updatedTimeStamp: DateTime.now(),
      );
      await updateTodo(objId!, todo);
      taskController.clear();
      Get.snackbar('Success', 'Your Todo Updated Successfully.');
      await gettingTodo();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update todo: ${e.toString()}');
    } finally {
      loader.value = false;
    }
  }

  Future<void> deletingTodo({String ?objId}) async {
    try {
      loader.value = true;
      await deletingTodo(objId: objId);
      Get.snackbar('Success', 'Your Todo Deleted Successfully.');
      await gettingTodo();
    } catch (e) {
      Get.snackbar('Failed : Some error occured', '$e');
    } finally {
      loader.value = false;
    }
  }
}
