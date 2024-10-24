import 'package:be_talent_desafio_mobile/components/dm_my_badge_component.dart';
import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:flutter/material.dart';

class DmAppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final bool headerWithLogo;
  const DmAppBarComponent({
    super.key,
    this.headerWithLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: headerWithLogo
            ? Image.asset(
                ImagesPath.blackLogo,
                width: 91,
                height: 34,
              )
            : CircleAvatar(
                backgroundColor: Pallete.gray05,
                child: Text(
                  "CG",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
      ),
      actions: headerWithLogo
          ? null
          : [
              DmMyBadgeComponent(
                value: "02", //Dado mockato para ser igual o exemplo.
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(ImagesPath.notificationIcon),
                ),
              ),
              Container(
                width: 10,
              )
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
