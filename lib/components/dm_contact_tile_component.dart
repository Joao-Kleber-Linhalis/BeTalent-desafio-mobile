import 'dart:convert';
import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:be_talent_desafio_mobile/controllers/home_screen_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DmContactTileComponent extends StatefulWidget {
  const DmContactTileComponent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<DmContactTileComponent> createState() => _DmContactTileComponentState();
}

class _DmContactTileComponentState extends State<DmContactTileComponent> {
  final screenController = HomeScreenController.instance;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.index == 0) {
      // Header com cor de fundo e bordas arredondadas nas partes superiores
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.gray10,
            width: 1,
          ),
          color: Pallete.blue10, // Defina a cor de fundo desejada
          borderRadius: const BorderRadius.only(
            topLeft:
                Radius.circular(8), // Arredondamento do canto superior esquerdo
            topRight:
                Radius.circular(8), // Arredondamento do canto superior direito
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 40, // Largura consistente com o CircleAvatar
            child: Center(
              child: Text(
                "Foto",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          title: Text(
            "Nome",
            style: Theme.of(context).textTheme.headlineMedium,
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

    final isLast = widget.index == screenController.filteredEmployees.length;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? 200 : 60,
      decoration: BoxDecoration(
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(
                    5), // Arredondamento do canto superior esquerdo
                bottomRight: Radius.circular(
                    5), // Arredondamento do canto superior direito
              )
            : null,
        border: const Border(
          left: BorderSide(
            color: Pallete.gray10,
            width: 1,
          ),
          right: BorderSide(
            color: Pallete.gray10,
            width: 1,
          ),
          bottom: BorderSide(
            color: Pallete.gray10,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                screenController.filteredEmployees[widget.index - 1].image,
              ),
            ),
            title: Text(
              utf8.decode(screenController
                  .filteredEmployees[widget.index - 1].name.codeUnits),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            trailing: Container(
              alignment: Alignment.center,
              width: 30, // Largura igual ao ícone no cabeçalho
              child: InkWell(
                child: Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Pallete.bluePrimary,
                  size: 30,
                ),
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _expanded ? 140 : 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: ListView(
              children: screenController
                  .filteredEmployees[widget.index - 1].detailsModel
                  .map(
                (details) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              details.label,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              details.value.toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        const DottedLine(
                          dashColor: Pallete.gray10,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
