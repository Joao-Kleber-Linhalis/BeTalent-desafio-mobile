import 'package:be_talent_desafio_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DmMyBadgeComponent extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const DmMyBadgeComponent({
    super.key,
    required this.child,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 10,
          top: 5,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Pallete.bluePrimary,
            ),
            constraints: BoxConstraints(
              minHeight: 22,
              minWidth: 22,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Pallete.white
              ),
            ),
          ),
        )
      ],
    );
  }
}
