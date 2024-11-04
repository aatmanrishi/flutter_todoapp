import 'package:flutter/material.dart';
import 'package:todo_app/Components/contentArea.dart';
import 'package:todo_app/Components/customAppBar.dart';
import 'package:get/get.dart';
import 'package:todo_app/Components/customDialgobox.dart';
import 'package:todo_app/Components/customFloatingActionButotn.dart';
import 'package:todo_app/controllers/mainController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   ;
    return Scaffold(
      floatingActionButton:CustomFloatingActionButton(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              CustomAppBar(),
              ContentArea(),
            ],
          ),
        ),
      ),
    );
  }
}
