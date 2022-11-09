import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqfilite_crud/Database/database_helper.dart';
import 'package:sqfilite_crud/Model/todo_model.dart';

class TodoController extends GetxController {
  RxBool loader = false.obs;
  final DbHelper _dbHelper = DbHelper();

  final TextEditingController student_id = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController university = TextEditingController();

  Random random = Random();

  @override
  void onInit() {
    super.onInit();
  }

  void submmit_data(BuildContext context) async {
    loader.value = true;
    update();
    var todoModel = TodoModel(
        id: random.nextInt(100),
        studentId: student_id.text,
        name: name.text,
        email: email.text,
        department: department.text,
        university: university.text,
        datetime: DateFormat().add_jm().format(DateTime.now()));
        await _dbHelper.addTodo(todoModel);

      Navigator.pop(context);
      student_id.clear();
      name.clear();
      email.clear();
      department.clear();
      university.clear();

    loader.value = false;
    update();
  }
}
