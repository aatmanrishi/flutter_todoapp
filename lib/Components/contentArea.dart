import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todo_app/Components/itemCard.dart';
import 'package:todo_app/controllers/mainController.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    final crudController = Get.find<CrudController>();

    return Positioned(
      top: 150,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            // Change this condition to show the loader when it is true
            if (crudController.loader.value) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 50,
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: crudController.todoList.isEmpty
                    ? [
                        Text('No items found'), // Widget for empty state
                      ]
                    : crudController.todoList.map((element) {
                        return ItemCard(
                          objId: element["objId"], // Access objId directly
                          todo: element["data"], // Access data directly
                        ); // Pass parameters correctly
                      }).toList(),
              );
            }
          }),
        ),
      ),
    );
  }
}
