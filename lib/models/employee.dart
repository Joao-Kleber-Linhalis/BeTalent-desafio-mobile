import 'dart:convert';

import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:be_talent_desafio_mobile/models/details_item.dart';
import 'package:be_talent_desafio_mobile/utils/tools.dart';
import 'package:http/http.dart' as http;

class Employee {
  final String id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  Employee({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      admissionDate: DateTime.parse(json['admission_date']),
      phone: json['phone'],
      image: json['image'],
    );
  }

  static const String _url = "${Constants.API_BASE_URL}/employees"; //Endpoint

  static Future<List<Employee>> loadEmployees() async {
    List<Employee> employees = [];
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final List<dynamic> repoEmployeeData = json.decode(response.body);
        employees =
            repoEmployeeData.map((json) => Employee.fromJson(json)).toList();
        return employees;
      } else {
        throw Exception(
            'Erro ao carregar os repositórios do usuário, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Erro ao carregar os funcionários: $e");
    }
  }

  //Já trabalhei com essa forma e foi muito fácil adicionar informações a ser mostradas no futuro, optei por adotar ela aqui também.
  List<DetailsItem> get detailsModel => [
        DetailsItem(
          label: "Cargo",
          value: job,
        ),
        DetailsItem(
          label: "Data de Admissão",
          value: Tools.formatDateToString(admissionDate),
        ),
        DetailsItem(
          label: "Telefone",
          value: Tools.formatPhoneNumber(phone),
        ),
      ];
}
