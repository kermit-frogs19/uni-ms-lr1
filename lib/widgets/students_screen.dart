import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/new_student.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/students.dart';
import 'package:seliukov_vadim_kiuki_21_9/providers/student_provider.dart';


class StudentsScreen extends ConsumerWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the students list from the provider
    final students = ref.watch(studentProvider);

    // Capture the notifier outside the widget lifecycle
    final studentNotifier = ref.read(studentProvider.notifier);

    return Scaffold(
      body: Students(
        students: students,
        onDelete: (index) {
          final deletedStudent = students[index];

          // Delete the student
          studentNotifier.deleteStudent(index);

          // Show SnackBar with undo option
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${deletedStudent.firstName} ${deletedStudent.lastName} deleted',
              ),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  // Re-add the deleted student
                  studentNotifier.addStudentAt(index, deletedStudent);
                },
              ),
            ),
          );
        },
        onEdit: (index, updatedStudent) {
          // Edit the student
          studentNotifier.editStudent(index, updatedStudent);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => NewStudent(
            onSave: (student) {
              // Add the student
              studentNotifier.addStudent(student);
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class StudentsScreen extends StatefulWidget {
//   const StudentsScreen({Key? key}) : super(key: key);

//   @override
//   State<StudentsScreen> createState() => _StudentsScreenState(); // Corrected name
// }

// class _StudentsScreenState extends State<StudentsScreen> {
//   final List<Student> students = [
//     Student(
//       firstName: 'Vadim',
//       lastName: 'Seliukov',
//       department: Department.it,
//       grade: 10,
//       gender: Gender.male,
//     ),
//   ];

//   void _addStudent(Student student) {
//     setState(() {
//       students.add(student);
//     });
//   }

//   void _editStudent(int index, Student updatedStudent) {
//     setState(() {
//       students[index] = updatedStudent;
//     });
//   }

//   void _deleteStudent(int index) {
//     final deletedStudent = students[index];
//     setState(() {
//       students.removeAt(index);
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${deletedStudent.firstName} ${deletedStudent.lastName} deleted'),
//         action: SnackBarAction(
//           label: 'UNDO',
//           onPressed: () {
//             setState(() {
//               students.insert(index, deletedStudent);
//             });
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Students(students: students, onDelete: _deleteStudent,onEdit: _editStudent,),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => NewStudent(onSave: _addStudent),),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }