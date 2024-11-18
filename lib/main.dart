import 'package:flutter/material.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/students.dart'; // Import the Students widget
import 'package:seliukov_vadim_kiuki_21_9/models/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of students
    final List<Student> students = [
      Student(
        firstName: 'Vadim',
        lastName: 'Seliukov',
        department: Department.it,
        grade: 10,
        gender: Gender.male,
      ),
      Student(
        firstName: 'Anni',
        lastName: 'Lyngstad',
        department: Department.finance,
        grade: 10,
        gender: Gender.female,
      ),
      Student(
        firstName: 'Al',
        lastName: 'Jardine',
        department: Department.law,
        grade: 10,
        gender: Gender.male,
      ),
      Student(
        firstName: 'Mike',
        lastName: 'Love',
        department: Department.medical,
        grade: 7,
        gender: Gender.male,
      ),
      Student(
        firstName: 'Ivan',
        lastName: 'Ivanov',
        department: Department.law,
        grade: 6,
        gender: Gender.male,
      ),
      Student(
        firstName: 'Anna',
        lastName: 'Petrova',
        department: Department.medical,
        grade: 8,
        gender: Gender.female,
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Students')),
        body: Students(students: students),
      ),
    );
  }
}