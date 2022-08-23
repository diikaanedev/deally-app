import 'package:deally_app/screen/register-normal-first-step.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterNormal extends StatefulWidget {
  const RegisterNormal({Key? key}) : super(key: key);

  @override
  _RegisterNormalState createState() => _RegisterNormalState();
}

class _RegisterNormalState extends State<RegisterNormal> {
  late Size size;
  int choix = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: meuveClair,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, true),
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.close,
                color: meuveFonce,
              ),
            ],
          ),
        ),
        leadingWidth: size.width * .1,
        title: GestureDetector(
          onTap: () => Navigator.pop(context, true),
          child: Row(
            children: [
              Text(
                'Sign up'.toUpperCase(),
                style:
                    TextStyle(color: meuveFonce, fontSize: size.width * .035),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      backgroundColor: blanc,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            // height: size.height * .3,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  children: [
                    Spacer(),
                    Icon(
                      CupertinoIcons.person_alt_circle,
                      size: size.width * .05,
                      color: gris,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: size.width * .7,
                      color: gris,
                      height: 5,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      CupertinoIcons.flag,
                      size: size.width * .05,
                      color: gris,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .1,
                    ),
                    Text(
                      '1. My Account',
                      style: TextStyle(fontSize: size.width * .03, color: gris),
                    ),
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Text(
                      '2. My informations',
                      style: TextStyle(fontSize: size.width * .03, color: gris),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Container(
                  width: size.width,
                  color: gris,
                  height: 5,
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .07,
                    ),
                    Text(
                      "Register as :",
                      style: TextStyle(
                          fontSize: size.width * .04,
                          fontWeight: FontWeight.w300,
                          color: meuveFonce),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .4,
                      child: BtnByDii(
                        haveBg: choix == 1,
                        titre: "Retailer",
                        onTap: () => setState(() {
                          choix = 1;
                        }),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .4,
                      child: BtnByDii(
                        haveBg: choix == 2,
                        titre: "Supplier",
                        onTap: () => setState(() {
                          choix = 2;
                        }),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .4,
                      child: BtnByDii(
                          haveBg: choix == 3,
                          titre: "Driver",
                          onTap: () => setState(() {
                                choix = 3;
                              })),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .94,
                      child: BtnByDiiConnexion(
                        onTap: () {
                          if (choix != 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterFirstStep(
                                          choix: choix,
                                        )));
                          }
                        },
                        titre: 'Next',
                        bgNormal: choix == 0 ? 0 : 1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
