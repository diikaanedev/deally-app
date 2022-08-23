import 'package:deally_app/screen/register-one.dart';
import 'package:deally_app/screen/register.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceRegister extends StatefulWidget {
  const ChoiceRegister({Key? key}) : super(key: key);

  @override
  _ChoiceRegisterState createState() => _ChoiceRegisterState();
}

class _ChoiceRegisterState extends State<ChoiceRegister> {
  int choix = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                color: meuveClair,
              ),
              Positioned(
                  top: constraints.maxHeight * .3,
                  left: -(constraints.maxWidth * .9),
                  child: Image.asset(
                    "assets/images/bg-sododin.png",
                  )),
              Positioned(
                  top: constraints.maxHeight * .15,
                  left: constraints.maxWidth * .1,
                  child: Container(
                    height: constraints.maxHeight * .45,
                    width: constraints.maxWidth * .8,
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            Icon(
                              CupertinoIcons.person_alt_circle,
                              color: meuveFonce,
                              size: constraints.maxHeight * .04,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * .01,
                            ),
                            Text(
                              'Connexion'.toUpperCase(),
                              style: TextStyle(
                                  color: meuveFonce,
                                  fontWeight: FontWeight.w300,
                                  fontSize: constraints.maxHeight * .025),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),

                        ///kelke choz ici

                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Text(
                              'Vous voulez vous connecter en tant que :',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .015,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Container(
                              height: constraints.maxHeight * .05,
                              width: constraints.maxWidth * .35,
                              child: BtnByDii(
                                haveBg: choix == 1,
                                titre: "Commerçant",
                                onTap: () => setState(() {
                                  choix = 1;
                                }),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Container(
                              height: constraints.maxHeight * .05,
                              width: constraints.maxWidth * .3,
                              child: BtnByDii(
                                haveBg: choix == 2,
                                titre: "fournisseurs",
                                onTap: () => setState(() {
                                  choix = 2;
                                }),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Container(
                              height: constraints.maxHeight * .05,
                              width: constraints.maxWidth * .4,
                              child: BtnByDii(
                                  haveBg: choix == 3,
                                  titre: "transporteur",
                                  onTap: () => setState(() {
                                        choix = 3;
                                      })),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .03,
                            ),
                            Container(
                              height: constraints.maxHeight * .05,
                              width: constraints.maxWidth * .7,
                              child: BtnByDiiConnexion(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterOne(),
                                    )),
                                titre: 'Continuer',
                                bgNormal: choix == 0 ? 0 : 1,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: blanc,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: Offset(1, 1),
                              color: Colors.black.withOpacity(.3))
                        ]),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: constraints.maxHeight * .3,
                    width: constraints.maxWidth,
                    color: blanc,
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 1,
                              width: constraints.maxWidth * .45,
                              color: meuveFonce,
                            ),
                            Spacer(),
                            Container(
                              width: constraints.maxWidth * .1,
                              child: Center(
                                child: Text(
                                  'OU',
                                  style: TextStyle(color: meuveFonce),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 1,
                              width: constraints.maxWidth * .45,
                              color: meuveFonce,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .03,
                        ),
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .4,
                          child: BtnByDii(
                            haveBg: false,
                            titre: 'Créer un compte',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterNormal(),
                                )),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
