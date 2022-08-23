// ignore_for_file: unnecessary_string_interpolations

import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class PhonePaysSelcted extends StatefulWidget {
  final String urlImage;
  final String indicatif;
  final String nom;

  const PhonePaysSelcted(
      {Key? key,
      required this.urlImage,
      required this.indicatif,
      required this.nom})
      : super(key: key);

  @override
  _PhonePaysSelctedState createState() => _PhonePaysSelctedState();
}

class _PhonePaysSelctedState extends State<PhonePaysSelcted> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Row(
            children: [
              Container(
                width: constraints.maxWidth * .25,
                height: constraints.maxHeight,
                child: widget.urlImage == ""
                    ? Row()
                    : Row(
                        children: [
                          Spacer(),
                          Container(
                              height: 10,
                              width: 20,
                              child: Image.asset(widget.urlImage)),
                          Container(
                            width: constraints.maxWidth * .15,
                            child: Text(
                              '${widget.indicatif}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .25,
                                  fontWeight: FontWeight.w300,
                                  color: noir),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: gris))),
              ),
              Container(
                width: constraints.maxWidth * .75,
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                        width: constraints.maxWidth * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Text(
                              widget.nom,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .25,
                                  fontWeight: FontWeight.w300,
                                  color: noir),
                            ),
                          ],
                        )),
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: gris))),
              ),
            ],
          ),
        );
      },
    );
  }
}
