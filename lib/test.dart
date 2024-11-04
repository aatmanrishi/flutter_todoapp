import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFirebase extends StatefulWidget {
  const TestFirebase({super.key});

  @override
  State<TestFirebase> createState() => _TestFirebaseState();
}

class _TestFirebaseState extends State<TestFirebase> {
  TextEditingController textController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the start
          children: [
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Enter title'),
            ),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Enter description'),
            ),
            const SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () async {
                String title = textController.text.trim();
                String desc = descController.text.trim();

                // Ensure title and description are not empty
                if (title.isNotEmpty && desc.isNotEmpty) {
                  try {
                    await _firestore.collection('notesapp').doc().set({
                      'title': title,
                      'desc': desc,
                    });

                    // Clear the text fields after saving
                    textController.clear();
                    descController.clear();
                    // Optionally, show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Note saved successfully!')),
                    );
                  } catch (e) {
                    // Handle any errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                } else {
                  // Show a warning if fields are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
