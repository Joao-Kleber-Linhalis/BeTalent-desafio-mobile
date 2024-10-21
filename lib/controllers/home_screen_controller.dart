import 'package:be_talent_desafio_mobile/models/employee.dart';
import 'package:flutter/material.dart';

class HomeScreenController {
  HomeScreenController._();

  static HomeScreenController? _instance;
  static HomeScreenController get instance {
    _instance ??= HomeScreenController._();
    return _instance!;
  }

  List<Employee> originalEmployees = [];
  List<Employee> filteredEmployees = [];
  late TextEditingController filterController;

  Future<void> initialize() async {
    filterController = TextEditingController();
  }

  void dispose() {
    filterController.dispose();
  }

  Future<void> loadEmployees() async {
    originalEmployees = await Employee.loadEmployees();
    filteredEmployees = originalEmployees;
    return;
  }
}
