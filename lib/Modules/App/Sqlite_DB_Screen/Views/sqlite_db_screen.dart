import 'dart:developer';

import 'package:database_sql_cloudfirestore/Modules/App/Sqlite_DB_Screen/Model/Student_Model/student_model.dart';
import 'package:database_sql_cloudfirestore/Modules/utils/Helpers/SQLite_DB_Helper/sqlite_db_helper.dart';
import 'package:flutter/material.dart';

class Sqlite_DB_Screen extends StatelessWidget {
  Sqlite_DB_Screen({super.key});

  TextEditingController gridController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  String? name;
  String? grid;
  String? course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: gridController,
              onChanged: (val) {
                grid = val;
              },
              decoration: InputDecoration(
                hintText: "enter GRID",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nameController,
              onChanged: (val) {
                name = val;
              },
              decoration: InputDecoration(
                hintText: "enter name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: courseController,
              onChanged: (val) {
                course = val;
              },
              decoration: InputDecoration(
                hintText: "enter course",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  Student data =
                      Student(name: name!, course: course!, grid: grid!);

                  int? res = await SQLite_Helper.sqLite_Helper
                      .insertStudent(data: data);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("data inserted to $res")),
                  );

                  log("============================");
                  log("$grid");
                  log("$name");
                  log("$course");
                  log("============================");
                  nameController.clear();
                  gridController.clear();
                  courseController.clear();
                },
                child: Text("Add Student"))
          ],
        ),
      ),
    );
  }
}
