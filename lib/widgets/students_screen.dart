import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/new_student.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/students.dart';
import 'package:seliukov_vadim_kiuki_21_9/providers/student_provider.dart';


class StudentsScreen extends ConsumerWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentProvider);

    final studentNotifier = ref.read(studentProvider.notifier);

    return Scaffold(
      body: Students(
        students: students,
        onDelete: (index) {
          final deletedStudent = students[index];

          studentNotifier.deleteStudent(index);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${deletedStudent.firstName} ${deletedStudent.lastName} deleted',
              ),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  studentNotifier.addStudentAt(index, deletedStudent);
                },
              ),
            ),
          );
        },
        onEdit: (index, updatedStudent) {
          studentNotifier.editStudent(index, updatedStudent);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => NewStudent(
            onSave: (student) {
              studentNotifier.addStudent(student);
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

