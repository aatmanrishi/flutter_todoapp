import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Components/customDialgobox.dart';
import 'package:todo_app/Model/Model.dart';

import '../controllers/mainController.dart';

class ItemCard extends StatelessWidget {
  final String objId;
  final Todo todo;

  const ItemCard({super.key, required this.objId, required this.todo});

  @override
  Widget build(BuildContext context) {
    final CrudController crudController = Get.find<CrudController>();

    return Container(
      margin: EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.yellow[400],
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Item No. and Title
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 2),
                  ),
                  color: Colors.amber[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: 50,
                height: 70,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                todo.todoTask,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          // Checkbox and Popup Menu Button close together
          Row(
            children: [
              Checkbox(
                side: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black,
                  width: 2,
                ),
                fillColor: MaterialStateProperty.all(Colors.white),
                checkColor: Colors.black,
                value: todo.isChecked,
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
              PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                color: Colors.yellow[200],
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'edit',
                    onTap: () {
                      // Triggered when the item is tapped
                      Get.dialog(
                        CustomDialogBox(
                          operationType: 'UPDATE',
                          task: todo.todoTask.toString(),
                          objId: objId,
                          checked: todo.isChecked,
                          created: todo.createdTimeStamp,
                          updated: todo.updatedTimeStamp,
                        ),
                        barrierDismissible: true,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Edit'),
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.brown[700],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    onTap: () {
                      // Triggered when the delete item is tapped
                      Get.dialog(
                        CustomDialogBox(
                          operationType: 'DELETE',
                          objId: objId,
                        ),
                        barrierDismissible: true,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delete'),
                        Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.red[800],
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'edit') {
                    // Handle edit action
                    print('Edit pressed');
                  } else if (value == 'delete') {
                    // Handle delete action
                    print('Delete pressed');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
