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
                      itemCount: screenController.filteredEmployees.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Header com cor de fundo e bordas arredondadas nas partes superiores
                          return Container(
                            decoration: const BoxDecoration(
                              color: Pallete
                                  .blue10, // Defina a cor de fundo desejada
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    8), // Arredondamento do canto superior esquerdo
                                topRight: Radius.circular(
                                    8), // Arredondamento do canto superior direito
                              ),
                            ),
                            child: ListTile(
                              leading: SizedBox(
                                width:
                                    40, // Largura consistente com o CircleAvatar
                                child: Center(
                                  child: Text(
                                    "Foto",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Nome",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              trailing: Container(
                                alignment: Alignment.center,
                                width:
                                    30, // Largura definida para alinhamento com os trailings da lista
                                child: const Icon(
                                  Icons.circle_rounded,
                                  color: Pallete.black,
                                  size: 8,
                                ),
                              ),
                            ),
                          );
                        }
                        index -= 1;
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Pallete.gray10,
                              width: 1,
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                screenController.filteredEmployees[index].image,
                              ),
                            ),
                            title: Text(
                              utf8.decode(screenController
                                  .filteredEmployees[index].name.codeUnits),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            trailing: Container(
                              alignment: Alignment.center,
                              width: 30, // Largura igual ao ícone no cabeçalho
                              child: InkWell(
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Pallete.bluePrimary,
                                  size: 30,
                                ),
                                onTap: () {},
                              ),
                            ),
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
