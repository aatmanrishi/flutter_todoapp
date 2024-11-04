import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Pages/Home.dart';
import 'package:todo_app/controllers/mainController.dart';
import 'package:todo_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put(CrudController());
    runApp(MyApp());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Home(), // Ensure Home() is correctly implemented
    );
  }
}
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_app/Pages/Home.dart';
// import 'package:todo_app/controllers/mainController.dart';
// import 'package:todo_app/firebase_options.dart';
// import 'package:todo_app/test.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // Initialize your controllers here if needed
//   // Get.put(CrudController());

//   runApp(const MyApp()); // Ensure MyApp is run after initialization
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//       debugShowCheckedModeBanner: false,
//       home:
//           const TestFirebase(), // Ensure TestFirebase is correctly implemented
//     );
//   }
// }
