import 'package:be_talent_desafio_mobile/components/dm_app_bar_component.dart';
import 'package:be_talent_desafio_mobile/components/dm_search_bar_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

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
          ],
        ),
      ),
    );
  }
}
