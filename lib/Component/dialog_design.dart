// ignore_for_file: prefer_const_constructors, duplicate_ignore, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/todo_controler.dart';

class DialogDesign extends StatelessWidget {
  const DialogDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(),
        builder: ((controller) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextField(
                      controller: controller.name,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Name",
                        label: Text("Name"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                    child: TextField(
                      controller: controller.student_id,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Student id",
                        label: Text("Student id"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                    child: TextField(
                      controller: controller.department,
                      decoration: InputDecoration(
                        hintText: "Department",
                        label: Text("Department"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                    child: TextField(
                      controller: controller.university,
                      decoration: InputDecoration(
                        hintText: "University",
                        label: Text("University"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controller.submmit_data(context);
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
