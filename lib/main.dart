import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqfilite_crud/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: TodoPage() ,
    );
  }
}

