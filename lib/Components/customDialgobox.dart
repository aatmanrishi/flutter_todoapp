import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:todo_app/controllers/mainController.dart';

class CustomDialogBox extends StatelessWidget {
  final String operationType;
  final String? objId;
  final String? task;
  final DateTime? created;
  final DateTime? updated;
  final bool? checked;
  final Callback? onTapFunction;

  const CustomDialogBox({
    super.key,
    required this.operationType,
    this.onTapFunction,
    this.task,
    this.created,
    this.updated,
    this.checked,
    this.objId,
  });

  @override
  Widget build(BuildContext context) {
    final CrudController crudController = Get.find();

    // Function to handle the tap event
    void handleTap() {
      if (operationType == 'DELETE') {
        crudController.deletingTodo(objId: objId);
      } else if (operationType == 'UPDATE') {
        crudController.editingTodoName(
          objId: objId,
          isChecked: checked,
          createdDateTime: created,
          updatedTime: updated,
        );
      } else {
        crudController.addingTodo();
      }
      Get.back(); // Close the dialog
    }

    return Dialog(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black, // Border color
            width: 4, // Border width
          ),
        ),
        padding: EdgeInsets.all(20),
        height: 220, // Adjust the height as needed
        width: MediaQuery.of(context).size.width * 0.9, // Adjust width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Prevent full screen
          children: [
            Text(
              operationType == 'UPDATE'
                  ? 'Update your task 🧑‍🏫'
                  : operationType == 'DELETE'
                      ? 'Are you sure you want to delete'
                      : 'Add your task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Spacing between elements
            operationType == 'DELETE'
                ? Container()
                : TextField(
                    controller:
                        crudController.taskController, // Use the controller
                    decoration: InputDecoration(
                      hintText:
                          task == null ? 'Enter your task' : task.toString(),
                      border: OutlineInputBorder(),
                    ),
                  ),
            SizedBox(height: 20), // Spacing between elements
            InkWell(
              onTap: handleTap, // Call the handleTap function
              child: Container(
                height: 45,
                width: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    operationType == 'UPDATE'
                        ? 'Update Note'
                        : operationType == 'DELETE'
                            ? 'Delte Note'
                            : 'Add Note', // onsistent capitalization
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
