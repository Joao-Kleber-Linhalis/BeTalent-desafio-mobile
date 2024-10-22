import 'dart:convert';
import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:be_talent_desafio_mobile/controllers/home_screen_controller.dart';
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

    return Container(
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
      child: ListTile(
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
  }
}
