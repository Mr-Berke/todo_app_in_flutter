import 'package:flutter/material.dart';
import 'package:to_do/utils/button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade200,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter Task Name',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Save", onPressed: onsave),
                SizedBox(
                  width: 10,
                ),
                Button(
                  text: "Cancel",
                  onPressed: oncancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
