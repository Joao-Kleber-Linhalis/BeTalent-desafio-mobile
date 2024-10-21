import 'dart:convert';

import 'package:be_talent_desafio_mobile/components/dm_app_bar_component.dart';
import 'package:be_talent_desafio_mobile/components/dm_search_bar_component.dart';
import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:be_talent_desafio_mobile/controllers/home_screen_controller.dart';
import 'package:be_talent_desafio_mobile/models/employee.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screenController = HomeScreenController.instance;
  TextEditingController textEditingController = TextEditingController();
  List<Employee> employees = [];
  @override
  void initState() {
    super.initState();
    screenController.initialize().then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Não entendi corretamente se era para usar o header do Style guide ou do protótipo, então implementei ambos, basta mudar o headerWithLogo de valor (true/false)
      appBar: const DmAppBarComponent(
        headerWithLogo: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Funcionários",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: DmSearchBarComponent(
                onChanged: (value) {},
                textEditingController: textEditingController,
                borderRadius: 100,
              ),
            ),
            FutureBuilder(
              future: screenController.loadEmployees(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                      child: Center(
                    child: Text(
                      "Não foi possível carregar a lista de contatos",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: screenController.filteredEmployees.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(

                            backgroundColor:
                                Theme.of(context).copyWith().colorScheme.primary,
                            radius: 24,
                            backgroundImage: NetworkImage(
                              screenController.filteredEmployees[index].image,
                            ),
                          ),
                          title: Text(
                            utf8.decode(screenController.filteredEmployees[index].name.codeUnits),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.keyboard_arrow_down_outlined),
                            color: Pallete.bluePrimary,
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
