// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    this.id,
    this.studentId,
    this.name,
    this.email,
    this.department,
    this.university,
    this.datetime,
  });

  int? id;
  String? studentId;
  String? name;
  String? email;
  String? department;
  String? university;
  String? datetime;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"] == null ? null : json["id"],
        studentId: json["student_id"] == null ? null : json["student_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        department: json["department"] == null ? null : json["department"],
        university: json["university"] == null ? null : json["university"],
        datetime: json["datetime"] == null ? null : json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "student_id": studentId == null ? null : studentId,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "department": department == null ? null : department,
        "university": university == null ? null : university,
        "datetime": datetime == null ? null : datetime,
      };
}
