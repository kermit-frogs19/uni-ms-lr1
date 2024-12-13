import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/departments_data.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/department_item.dart';
import 'package:seliukov_vadim_kiuki_21_9/providers/student_provider.dart';

class DepartmentsScreen extends ConsumerWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departmentStudentCounts = ref.watch(departmentStudentCountsProvider);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2.5, 
      ),
      itemCount: departments.length,
      itemBuilder: (context, index) {
        final department = departments[index];
        final studentCount = departmentStudentCounts[department.enumValue] ?? 0;

        return DepartmentItem(
          department: department,
          studentCount: studentCount,
        );
      },
    );
  }
}