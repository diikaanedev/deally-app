import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class BtnByDii extends StatefulWidget {
  final bool haveBg;
  final String titre;
  final Function onTap;
  const BtnByDii({
    Key? key,
    required this.haveBg,
    required this.onTap,
    required this.titre,
  }) : super(key: key);

  @override
  _BtnByDiiState createState() => _BtnByDiiState();
}

class _BtnByDiiState extends State<BtnByDii> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => widget.onTap(),
          child: Container(
            height: constraints.maxHeight * .9,
            decoration: BoxDecoration(
                border: Border.all(color: widget.haveBg ? meuveFonce : gris),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                '   ${widget.titre}   '.toUpperCase(),
                style: TextStyle(
                    fontSize: constraints.maxHeight * .3,
                    color: widget.haveBg ? meuveFonce : noir,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
        );
      },
    );
  }
}
