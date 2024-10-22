import 'package:be_talent_desafio_mobile/components/dm_contact_tile_component.dart';
import 'package:be_talent_desafio_mobile/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';

class DmContactListComponent extends StatelessWidget {
  DmContactListComponent({
    super.key,
  });

  final screenController = HomeScreenController.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: screenController.filteredEmployees.length + 1,
        itemBuilder: (context, index) {
          return DmContactTileComponent(index: index);
        },
      ),
    );
  }
}
