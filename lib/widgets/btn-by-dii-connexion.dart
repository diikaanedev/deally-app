import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class BtnByDiiConnexion extends StatefulWidget {
  final int bgNormal;

  final String titre;

  final Function onTap;

  const BtnByDiiConnexion(
      {Key? key,
      required this.titre,
      required this.onTap,
      required this.bgNormal})
      : super(key: key);

  @override
  _BtnByDiiConnexionState createState() => _BtnByDiiConnexionState();
}

class _BtnByDiiConnexionState extends State<BtnByDiiConnexion> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => widget.onTap(),
          child: Container(
              height: constraints.maxHeight * .9,
              decoration: BoxDecoration(
                  color: widget.bgNormal == 1
                      ? meuveFonce
                      : widget.bgNormal == 0
                          ? meuveFonce.withOpacity(.3)
                          : widget.bgNormal == 3
                              ? noir
                              : blanc,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  if (widget.bgNormal != 2) Spacer(),
                  if (widget.bgNormal == 2)
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                  if (widget.bgNormal == 2)
                    Icon(
                      Icons.arrow_back,
                      color: widget.bgNormal == 1
                          ? blanc
                          : widget.bgNormal == 0
                              ? blanc
                              : noir,
                      size: constraints.maxHeight * .5,
                    ),
                  Text(
                    '   ${widget.titre}  '.toUpperCase(),
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .3,
                        color: widget.bgNormal == 1
                            ? blanc
                            : widget.bgNormal == 0
                                ? blanc
                                : widget.bgNormal == 3
                                    ? blanc
                                    : noir,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal),
                  ),
                  if (widget.bgNormal != 2) Spacer(),
                  if (widget.bgNormal != 2 && widget.bgNormal != 3)
                    Icon(
                      Icons.arrow_forward,
                      color: blanc,
                      size: constraints.maxHeight * .0,
                    ),
                  if (widget.bgNormal != 2 || widget.bgNormal == 3)
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                  if (widget.bgNormal == 2 || widget.bgNormal == 3) Spacer()
                ],
              )),
        );
      },
    );
  }
}
