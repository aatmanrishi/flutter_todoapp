import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Components/customDialgobox.dart';
import 'package:todo_app/controllers/mainController.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CrudController crudController = Get.find<CrudController>();
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Colors.yellow,
      onPressed: () {
        Get.dialog(
          CustomDialogBox(
            operationType: 'ADD',
            onTapFunction: crudController.addingTodo,
          ),
          barrierDismissible: true, // Allows dismissing by tapping outside
        );
      },
      child: Icon(
        Icons.add,
        size: 28,
      ),
    );
  }
}
