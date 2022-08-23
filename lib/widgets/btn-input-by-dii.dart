import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnInputByDii extends StatefulWidget {
  final String titre;
  final TextEditingController controller;
  final TextInputType typeKeyboard;
  final FocusNode focusNode;
  final Function ontap;
  final String pattern;
  final bool haveBg;
  const BtnInputByDii(
      {Key? key,
      required this.titre,
      required this.controller,
      required this.typeKeyboard,
      required this.focusNode,
      required this.ontap,
      required this.haveBg,
      required this.pattern})
      : super(key: key);

  @override
  _BtnInputByDiiState createState() => _BtnInputByDiiState();
}

class _BtnInputByDiiState extends State<BtnInputByDii> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
            onTap: () => widget.ontap(),
            child: Center(
              child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: widget.haveBg
                      ? Stack(
                          children: [
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: meuveFonce)),
                            ),
                            Positioned(
                                top: constraints.maxHeight * .02,
                                left: constraints.maxWidth * .02,
                                child: Container(
                                  child: Text(
                                    widget.titre,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: constraints.maxHeight * .3),
                                  ),
                                )),
                            Positioned(
                                top: constraints.maxHeight * .4,
                                left: constraints.maxWidth * .03,
                                child: Container(
                                  height: constraints.maxHeight * .5,
                                  width: constraints.maxWidth * .95,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * .7,
                                        height: constraints.maxHeight * .4,
                                        child: Center(
                                          child: TextFormField(
                                            cursorHeight:
                                                constraints.maxHeight * .4,
                                            keyboardType: widget.typeKeyboard,
                                            focusNode: widget.focusNode,
                                            controller: widget.controller,
                                            validator: (String? value) {
                                              String pattern = widget.pattern;
                                              RegExp regExp =
                                                  new RegExp(pattern);
                                              if (value!.isEmpty) {
                                                return null;
                                              }
                                              if (!regExp.hasMatch(value)) {
                                                return '';
                                              }
                                              print("no sence");

                                              return null;
                                            },
                                            style: TextStyle(
                                                fontSize:
                                                    constraints.maxHeight * .4),
                                            decoration: InputDecoration(
                                              hintText: widget.controller.text,
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize:
                                                      constraints.maxHeight *
                                                          .03),
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      : widget.controller.text == ""
                          ? Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  border: Border.all(color: gris),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Text(
                                    '   ${widget.titre}   ',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .3,
                                        color:
                                            widget.haveBg ? meuveFonce : noir,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  border: Border.all(color: gris),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Text(
                                    '   ${widget.controller.text}   ',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .3,
                                        color:
                                            widget.haveBg ? meuveFonce : noir,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ],
                              ),
                            )),
            ));
      },
    );
  }
}
