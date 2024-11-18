import 'package:flutter/material.dart';
import 'package:seliukov_vadim_kiuki_21_9/models/student.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/student_item.dart';

class Students extends StatelessWidget {
  const Students({
    Key? key,
    required this.students,
  }) : super(key: key);

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) => StudentItem(
        student: students[index],
      ),
    );
  }
}