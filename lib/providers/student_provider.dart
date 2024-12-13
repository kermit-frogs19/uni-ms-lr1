import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';
// Import your departments list

// State Notifier for managing the students list
class StudentNotifier extends StateNotifier<List<Student>> {
  StudentNotifier() : super([
    Student(
      firstName: 'Vadim',
      lastName: 'Seliukov',
      department: Department.it,
      grade: 10,
      gender: Gender.male,
    ),
  ]);

  void addStudent(Student student) {
    state = [...state, student];
  }

  void addStudentAt(int index, Student student) {
    final students = [...state];
    students.insert(index, student);
    state = students;
  }

  void editStudent(int index, Student updatedStudent) {
    final students = [...state];
    students[index] = updatedStudent;
    state = students;
  }

  void deleteStudent(int index) {
    final students = [...state];
    students.removeAt(index);
    state = students;
  }



}

final studentProvider = StateNotifierProvider<StudentNotifier, List<Student>>(
  (ref) => StudentNotifier(),
);

// Derived provider to calculate student counts by department
final departmentStudentCountsProvider = Provider<Map<Department, int>>((ref) {
  final students = ref.watch(studentProvider);

  // Initialize counts for all Department enum values
  final counts = <Department, int>{
    for (var department in Department.values) department: 0,
  };

  // Count students for each department
  for (var student in students) {
    counts[student.department] = (counts[student.department] ?? 0) + 1;
  }

  return counts;
});

// Notifier for handling temporary deleted student state
class DeletedStudentNotifier extends StateNotifier<Map<int, Student>> {
  DeletedStudentNotifier() : super({});

  void setDeletedStudent(int index, Student student) {
    state = {index: student};
  }

  void clearDeletedStudent() {
    state = {};
  }
}

// Provider for managing deleted students
final deletedStudentProvider =
    StateNotifierProvider<DeletedStudentNotifier, Map<int, Student>>(
  (ref) => DeletedStudentNotifier(),
);