import 'package:be_talent_desafio_mobile/models/employee.dart';
import 'package:diacritic/diacritic.dart';
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
    originalEmployees.clear();
  }

  Future<void> loadEmployees() async {
    if (originalEmployees.isEmpty) {
      originalEmployees = await Employee.loadEmployees();
      filteredEmployees = originalEmployees;
    }
    return;
  }

  void filter(String filter) {
    if (filter.isEmpty) {
      print("object");
      filteredEmployees = originalEmployees;
    } else {
      print(filter);
      final lowerCaseFilter = removeDiacritics(filter).toLowerCase();

      filteredEmployees = originalEmployees.where((employee) {
        final nameMatches = removeDiacritics(employee.name)
            .toLowerCase()
            .contains(lowerCaseFilter);
        final jobMatches = removeDiacritics(employee.job)
            .toLowerCase()
            .contains(lowerCaseFilter);

        final phoneNormalized = employee.phone.replaceAll(
            RegExp(r'[^\d]'), ''); // Remove caracteres não numéricos
        final filterNormalized = filter.replaceAll(
            RegExp(r'[^\d]'), ''); // Remove caracteres não numéricos do filtro

        final phoneMatches = filterNormalized.isEmpty
            ? false
            : phoneNormalized.contains(filterNormalized);

        print("name $nameMatches");
        print("job $jobMatches");
        print("phone $phoneMatches");

        return nameMatches || jobMatches || phoneMatches;
      }).toList();
      print(filteredEmployees.length);
    }
  }
}
