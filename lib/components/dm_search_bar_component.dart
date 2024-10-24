import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:flutter/material.dart';

class DmSearchBarComponent extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController textEditingController;
  final String hintText;
  final double borderRadius;

  const DmSearchBarComponent({
    super.key,
    required this.onChanged,
    required this.textEditingController,
    this.hintText = "Pesquisar",
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStateProperty.all<double>(0),
      backgroundColor: WidgetStateProperty.all<Color>(
        Pallete.gray05,
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), //Borda
            side: const BorderSide(
              color: Pallete.gray10,
              width: 1,
            )),
      ),
      onChanged: (value) => onChanged(value),
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.search,
          color: Pallete.black,
          size: 24,
        ),
      ),
      controller: textEditingController,
      hintText: hintText,
      textStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
