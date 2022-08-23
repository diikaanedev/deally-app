import 'package:deally_app/screen/recouver-password.dart';
import 'package:deally_app/screen/register-one.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnRegisterByDii extends StatefulWidget {
  final bool haveBg;
  final int choix; // choix représente si le le phone ou email ou password
  final String titre;
  final Function ontap;
  final TextInputType typeKeyboard;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String pattern;
  final String messageVide;
  final Object objectGstate;
  const BtnRegisterByDii(
      {Key? key,
      required this.haveBg,
      required this.choix,
      required this.titre,
      required this.typeKeyboard,
      required this.controller,
      required this.focusNode,
      required this.messageVide,
      required this.objectGstate,
      required this.ontap,
      required this.pattern})
      : super(key: key);

  @override
  _BtnRegisterByDiiState createState() => _BtnRegisterByDiiState();
}

class _BtnRegisterByDiiState extends State<BtnRegisterByDii> {
  late bool isShow;
  bool haveBlem = false;
  bool isVide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.choix == 2) {
      setState(() {
        isShow = true;
      });
    } else {
      setState(() {
        isShow = false;
      });
    }
  }

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
              decoration: BoxDecoration(
                  border: Border.all(color: gris),
                  borderRadius: BorderRadius.circular(8)),
              child: widget.haveBg
                  ? Stack(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                        ),
                        Positioned(
                            child: Container(
                          height: isVide
                              ? constraints.maxHeight
                              : constraints.maxHeight,
                          width: isVide
                              ? constraints.maxWidth * .96
                              : constraints.maxWidth,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: isVide ? rouge : meuveFonce,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        )),
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
                                  if (widget.choix == 1)
                                    GestureDetector(
                                      onTap: () {
                                        registerOneState.setState(() {
                                          registerOneState
                                                  .viewPhoneIndicatifSelectd =
                                              !registerOneState
                                                  .viewPhoneIndicatifSelectd;
                                        });
                                        widget.focusNode.unfocus();
                                      },
                                      child: Container(
                                        height: constraints.maxHeight * .5,
                                        width: constraints.maxWidth * .2,
                                        child: Row(
                                          children: [
                                            Container(
                                              height:
                                                  constraints.maxHeight * .4,
                                              width: constraints.maxWidth * .05,
                                              child: Image.asset(
                                                  "assets/images/drapeau-france.png"),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "+33",
                                              style: TextStyle(
                                                  fontSize:
                                                      constraints.maxHeight *
                                                          .25,
                                                  fontWeight: FontWeight.w300,
                                                  color: noir),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                          RegExp regExp = new RegExp(pattern);
                                          if (value!.isEmpty) {
                                            setState(() {
                                              isVide = true;
                                            });
                                            return null;
                                          }
                                          if (!regExp.hasMatch(value)) {
                                            print("erreur");
                                            setState(() {
                                              haveBlem = true;
                                            });

                                            return '';
                                          }
                                          print("no sence");
                                          setState(() {
                                            haveBlem = false;
                                            isVide = false;
                                          });

                                          return null;
                                        },
                                        obscureText: isShow,
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .3),
                                        decoration: InputDecoration(
                                          hintText: widget.controller.text,
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize:
                                                  constraints.maxHeight * .03),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        if (widget.choix == 2 && !isVide)
                          Positioned(
                              top: constraints.maxHeight * .25,
                              right: constraints.maxWidth * .02,
                              child: GestureDetector(
                                  onTap: () => setState(() {
                                        isShow = !isShow;
                                      }),
                                  child: Icon(isShow
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash))),
                        if (isVide)
                          Positioned(
                              right: 0,
                              top: (constraints.maxHeight / 4),
                              child: Container(
                                color: blanc,
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: rouge,
                                ),
                              )),
                      ],
                    )
                  : widget.controller.text == ""
                      ? Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Text(
                              '   ${widget.titre}   ',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .37,
                                  color: widget.haveBg ? meuveFonce : noir,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                            ),
                            Positioned(
                                child: Container(
                              height: isVide
                                  ? constraints.maxHeight
                                  : constraints.maxHeight,
                              width: isVide
                                  ? constraints.maxWidth * .96
                                  : constraints.maxWidth,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isVide ? rouge : meuveFonce,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                            )),
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
                                      if (widget.choix == 1)
                                        GestureDetector(
                                          onTap: () {
                                            recouverPasswordState.setState(() {
                                              recouverPasswordState
                                                      .viewPhoneIndicatifSelectd =
                                                  !recouverPasswordState
                                                      .viewPhoneIndicatifSelectd;
                                            });
                                            registerOneState.setState(() {
                                              registerOneState
                                                      .viewPhoneIndicatifSelectd =
                                                  !registerOneState
                                                      .viewPhoneIndicatifSelectd;
                                            });

                                            widget.focusNode.unfocus();
                                          },
                                          child: Container(
                                            height: constraints.maxHeight * .5,
                                            width: constraints.maxWidth * .2,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          .4,
                                                  width: constraints.maxWidth *
                                                      .05,
                                                  child: Image.asset(
                                                      "assets/images/drapeau-france.png"),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "+33",
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .25,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: noir),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      Container(
                                        width: constraints.maxWidth * .7,
                                        height: constraints.maxHeight * .4,
                                        child: Row(
                                          children: [
                                            Text(widget.controller.text),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            if (widget.choix == 2 && !isVide)
                              Positioned(
                                  top: constraints.maxHeight * .25,
                                  right: constraints.maxWidth * .02,
                                  child: GestureDetector(
                                      onTap: () => setState(() {
                                            isShow = !isShow;
                                          }),
                                      child: Icon(isShow
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_slash))),
                            if (isVide)
                              Positioned(
                                  right: 0,
                                  top: (constraints.maxHeight / 4),
                                  child: Container(
                                    color: blanc,
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: rouge,
                                    ),
                                  )),
                          ],
                        ),
            ),
          ),
        );
      },
    );
  }
}
