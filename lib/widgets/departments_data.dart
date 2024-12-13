import 'package:flutter/material.dart';
import 'package:seliukov_vadim_kiuki_21_9/models/department.dart';
import 'package:seliukov_vadim_kiuki_21_9/models/student.dart';


final List<DepartmentModel> departments = [
  DepartmentModel(
    id: '1',
    name: 'IT',
    color: Colors.blue,
    icon: Icons.computer,
    enumValue: Department.it,
  ),
  DepartmentModel(
    id: '2',
    name: 'Finance',
    color: Colors.green,
    icon: Icons.account_balance,
    enumValue: Department.finance,
  ),
  DepartmentModel(
    id: '3',
    name: 'Law',
    color: Colors.purple,
    icon: Icons.gavel,
    enumValue: Department.law,
  ),
  DepartmentModel(
    id: '4',
    name: 'Medical',
    color: Colors.red,
    icon: Icons.medical_services,
    enumValue: Department.medical,
  ),
];