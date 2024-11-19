import 'package:flutter/material.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/new_student.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/students.dart';
import 'package:seliukov_vadim_kiuki_21_9/models/student.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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


  void _addStudent(Student student) {
    setState(() {
      students.add(student);
    });
  }

  void _editStudent(int index, Student updatedStudent) {
    setState(() {
      students[index] = updatedStudent;
    });
  }

  void _deleteStudent(int index) {
    final deletedStudent = students[index];
    setState(() {
      students.removeAt(index);
    }); 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${deletedStudent.firstName} ${deletedStudent.lastName} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              students.insert(index, deletedStudent);
            });
          },
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Students(students: students, onDelete: _deleteStudent, onEdit: _editStudent,),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => NewStudent(onSave: _addStudent),
    ),
        child: const Icon(Icons.add),
      ),
    );
  }
}