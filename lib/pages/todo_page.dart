// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import, unnecessary_const, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqfilite_crud/Component/dialog_design.dart';
import 'package:sqfilite_crud/pages/todo_controler.dart';
import '../Database/database_helper.dart';
import '../Model/todo_model.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final DbHelper _dbHelper = DbHelper();

  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogDesign();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: ((controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            elevation: 5,
            title: const Center(child: const Text("Todo")),
          ),
          backgroundColor: Colors.blue[200],

          //Floting Action Button
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: createNewTask,
            child: const Icon(Icons.add),
          ),

          body: FutureBuilder(
            future: _dbHelper.getTodoModel(),
            builder: (BuildContext context,
                AsyncSnapshot<List<TodoModel>?> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something went Wrong"),
                );
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                width: 100.0,
                                height: 160.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Name: ${snapshot.data![index].name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "ID: ${snapshot.data![index].studentId}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Email: ${snapshot.data![index].email}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Department: ${snapshot.data![index].department}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "University: ${snapshot.data![index].university}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    "${snapshot.data![index].datetime}",style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),),
                                                SizedBox(
                                                  height: 80,
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    showDialog(context: context, builder: (context){
                                                      return AlertDialog(
                                                        title: Text("Delete"),
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Text("Are you sure want to delete?"),

                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                ElevatedButton(

                                                                    style: ElevatedButton.styleFrom(primary: Colors.red),

                                                                    onPressed: (){
                                                                      _dbHelper.delete(snapshot.data![index].id!);
                                                                      Navigator.pop(context);

                                                                      setState(() {

                                                                      });
                                                                    }, child: Text("Yes")),
                                                                SizedBox(width: 20,),
                                                                ElevatedButton(onPressed: (){
                                                                  Navigator.pop(context);
                                                                }, child: Text("No")),
                                                                SizedBox(width: 20,),

                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      );
                                                    });
                                                  },
                                                  child: Icon(Icons.delete,color: Colors.pink,size: 30,),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ])),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
              return Container();
            },
          ),

          //Showing all task here
        );
      }),
    );
  }
}
