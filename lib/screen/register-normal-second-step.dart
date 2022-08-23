import 'dart:developer';

import 'package:deally_app/screen/politique-confidentialite.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-input-by-dii.dart';
import 'package:deally_app/widgets/sexe-widget--bydii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterSecondStep extends StatefulWidget {
  final int choix;
  final String password;
  final String telephone;
  const RegisterSecondStep(
      {Key? key,
      required this.choix,
      required this.password,
      required this.telephone})
      : super(key: key);

  @override
  _RegisterSecondStepState createState() => _RegisterSecondStepState();
}

class _RegisterSecondStepState extends State<RegisterSecondStep> {
  late Size size;
  int choix = 0;
  int sexe = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomI = TextEditingController();
  TextEditingController prenomI = TextEditingController();
  TextEditingController villeI = TextEditingController();
  TextEditingController emailI = TextEditingController();
  TextEditingController nomSocieteI = TextEditingController();
  TextEditingController fonctionI = TextEditingController();
  TextEditingController registreCommerceI = TextEditingController();
  FocusNode nom = FocusNode();
  FocusNode prenom = FocusNode();
  FocusNode ville = FocusNode();
  FocusNode email = FocusNode();
  FocusNode nomSociete = FocusNode();
  FocusNode fonction = FocusNode();
  FocusNode registreCommerce = FocusNode();
  bool isCheckCondition = false;
  bool isCheckInformations = false;
  bool souvenir = false;
  bool isVidePhone = false;
  bool isVidePassword = false;
  int inputType = 0;
  bool viewPhoneIndicatifSelectd = false;
  bool isreverse = false;
  bool isChargement = false;
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
                Icons.arrow_back,
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
                'Back'.toUpperCase(),
                style:
                    TextStyle(color: meuveFonce, fontSize: size.width * .035),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      backgroundColor: blanc,
      body: ListView(
        reverse: isreverse,
        shrinkWrap: true,
        children: [
          Stack(
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
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: size.width * .35,
                          decoration: BoxDecoration(
                              color: meuveFonce,
                              borderRadius: BorderRadius.circular(2)),
                          height: 5,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          CupertinoIcons.person_alt_circle,
                          size: size.width * .05,
                          color: meuveFonce,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: size.width * .35,
                          decoration: BoxDecoration(
                              color: gris,
                              borderRadius: BorderRadius.circular(2)),
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
                          '1.My Account',
                          style: TextStyle(
                              fontSize: size.width * .03, color: noir),
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Text(
                          '2. My informations',
                          style: TextStyle(
                              fontSize: size.width * .03, color: noir),
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
                    Container(
                      // height: size.height * .63,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .07,
                              ),
                              Text(
                                "My personal information",
                                style: TextStyle(
                                    fontSize: size.width * .04,
                                    fontWeight: FontWeight.w300,
                                    color: meuveFonce),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .07,
                              ),
                              Text(
                                "Make sure your informations are the same as on your ID",
                                style: TextStyle(
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .07,
                              ),
                              Expanded(
                                  child: SexeByDiiChoix(
                                      titre: "Mr",
                                      actif: sexe == 1,
                                      onTap: () => setState(() {
                                            sexe = 1;
                                          }))),
                              Expanded(
                                  child: SexeByDiiChoix(
                                      titre: "Ms",
                                      actif: sexe == 2,
                                      onTap: () => setState(() {
                                            sexe = 2;
                                          }))),
                              SizedBox(
                                width: size.width * .07,
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
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
                                      child: BtnInputByDii(
                                        titre: "Your last name",
                                        // messageVide: "Saissisez votre nom de famille",
                                        pattern: r'(^[a-zA-Z ]*$)',
                                        typeKeyboard: TextInputType.name,
                                        focusNode: nom,
                                        controller: nomI,
                                        // choix: 1,
                                        haveBg: inputType == 2,
                                        ontap: () {
                                          setState(() {
                                            inputType = 2;
                                            isreverse = true;
                                          });
                                          nom.requestFocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                                child: BtnInputByDii(
                                  titre: "Your first name",
                                  // messageVide: "Saissisez votre mot de passe",
                                  pattern: r'(^[a-zA-Z ]*$)',
                                  typeKeyboard: TextInputType.name,
                                  focusNode: prenom,
                                  controller: prenomI,
                                  // choix: 2,
                                  haveBg: inputType == 3,
                                  ontap: () {
                                    prenom.requestFocus();
                                    setState(() {
                                      isreverse = true;
                                      inputType = 3;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          if (widget.choix != 1)
                            Container(
                              child: Column(
                                children: [
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
                                        child: BtnInputByDii(
                                          titre: "Your function",
                                          // messageVide: "Saissisez votre nom de famille",
                                          pattern: r'(^[a-zA-Z ]*$)',
                                          typeKeyboard: TextInputType.name,
                                          focusNode: fonction,
                                          controller: fonctionI,
                                          // choix: 1,
                                          haveBg: inputType == 4,
                                          ontap: () {
                                            setState(() {
                                              inputType = 4;
                                              isreverse = true;
                                            });
                                            fonction.requestFocus();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            child: Column(
                              children: [
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
                                      child: BtnInputByDii(
                                        titre: "CAC registration name",
                                        // messageVide: "Saissisez votre nom de famille",
                                        pattern: r'(^[a-zA-Z ]*$)',
                                        typeKeyboard: TextInputType.name,
                                        focusNode: nomSociete,
                                        controller: nomSocieteI,
                                        // choix: 1,
                                        haveBg: inputType == 1,
                                        ontap: () {
                                          setState(() {
                                            inputType = 1;
                                            isreverse = true;
                                          });
                                          nomSociete.requestFocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
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
                                      child: BtnInputByDii(
                                        titre: " CAC registration number",
                                        // messageVide: "Saissisez votre nom de famille",
                                        pattern: r'(^[a-zA-Z ]*$)',
                                        typeKeyboard: TextInputType.number,
                                        focusNode: registreCommerce,
                                        controller: registreCommerceI,
                                        // choix: 1,
                                        haveBg: inputType == 5,
                                        ontap: () {
                                          setState(() {
                                            inputType = 5;
                                            isreverse = true;
                                          });
                                          registreCommerce.requestFocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                                child: BtnInputByDii(
                                  titre: "Town",
                                  // messageVide: "Saissisez votre ville",
                                  pattern: r'(^[a-zA-Z ]*$)',
                                  typeKeyboard: TextInputType.streetAddress,
                                  focusNode: ville,
                                  controller: villeI,
                                  // choix: 2,
                                  haveBg: inputType == 6,
                                  ontap: () {
                                    ville.requestFocus();
                                    setState(() {
                                      isreverse = true;
                                      inputType = 6;
                                    });
                                  },
                                ),
                              ),
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
                                child: BtnInputByDii(
                                  titre: "Email (optional) ",
                                  // messageVide: "Saissisez votre email",
                                  pattern: r'(^[a-zA-Z]*$)',
                                  typeKeyboard: TextInputType.emailAddress,
                                  focusNode: email,
                                  controller: emailI,
                                  // choix: 2,
                                  haveBg: inputType == 7,
                                  ontap: () {
                                    email.requestFocus();
                                    setState(() {
                                      isreverse = true;
                                      inputType = 7;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .07,
                              ),
                              GestureDetector(
                                onTap: () => setState(() {
                                  isCheckCondition = !isCheckCondition;
                                }),
                                child: Container(
                                  height: 23,
                                  width: 23,
                                  child: isCheckCondition
                                      ? Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 20,
                                            color: meuveFonce,
                                          ),
                                        )
                                      : Container(),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: meuveFonce, width: 2)),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: size.width * .8,
                                // height: 50,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PolitiqueConfidentialite()));
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: noir,
                                            fontSize: size.width * .035),
                                        children: [
                                          const TextSpan(
                                              text: "I accept deally's "),
                                          TextSpan(
                                              text: "<<",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: meuveFonce)),
                                          TextSpan(
                                              // recognizer: TapGestureRecognizer()
                                              //   ..onTap = () {},
                                              text: " Terms of Service",
                                              style: TextStyle(
                                                  color: meuveFonce,
                                                  fontSize: size.width * .035)),
                                          TextSpan(
                                              text: " >>",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: meuveFonce)),
                                          const TextSpan(text: " & "),
                                          TextSpan(
                                              text: " <<",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: meuveFonce)),
                                          TextSpan(
                                              // recognizer: TapGestureRecognizer()
                                              //   ..onTap = () {
                                              //     print(
                                              //         "Politique de confidentialité");
                                              //   },
                                              text: " Privacy Policy",
                                              style: TextStyle(
                                                  color: meuveFonce,
                                                  fontSize: size.width * .035)),
                                          TextSpan(
                                              text: " >>",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: meuveFonce)),
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .07,
                              ),
                              Container(
                                height: size.height * .1,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        isCheckInformations =
                                            !isCheckInformations;
                                      }),
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        child: isCheckInformations
                                            ? Center(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 20,
                                                  color: meuveFonce,
                                                ),
                                              )
                                            : Container(),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: meuveFonce, width: 2)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: size.width * .8,
                                height: size.height * .1,
                                // color: rouge,
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: noir,
                                          fontSize: size.width * .035),
                                      children: [
                                        const TextSpan(
                                            text:
                                                "Yes, I would like to receive the latest information and offers from"),
                                        TextSpan(
                                            text: " Deally ",
                                            style:
                                                TextStyle(color: meuveFonce)),
                                        const TextSpan(
                                            text:
                                                " by e-mail, SMS or any other electronics devices. Unsubscribe possible at any time.")
                                      ]),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                        ],
                      ),
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
                            onTap: isChargement
                                ? () => null
                                : () async {
                                    setState(() {
                                      isChargement = true;
                                    });
                                    if (widget.choix == 1) {
                                      if (nomI.text != "" &&
                                          prenomI.text != "" &&
                                          villeI.text != "" &&
                                          sexe != 0 &&
                                          isCheckCondition) {
                                        Map<String, dynamic> body = {
                                          "phone": widget.telephone,
                                          "password": widget.password,
                                          "firstName": prenomI.text,
                                          "lastName": nomI.text,
                                          "role": "commercant",
                                          "city": villeI.text,
                                          "nameShop": nomSocieteI.text,
                                          "sexe": sexe == 1 ? "homme" : "femme",
                                          "hasAcceptedNewsletter":
                                              isCheckInformations,
                                          "email": emailI.text
                                        };
                                        print(body);
                                        postResponse(url: '/users', body: body)
                                            .then((value) async {
                                          print(value);
                                          if (value['status'] == 200) {
                                            await SharedPreferences
                                                    .getInstance()
                                                .then((prefs) {
                                              prefs.setString(
                                                  'token',
                                                  value['body']['data']
                                                      ['token']);
                                              prefs.setString(
                                                  'role', "commercant");
                                              prefs.setString('name',
                                                  '${prenomI.text} ${nomI.text}');
                                            });

                                            Navigator.pushNamed(context, '/');
                                          }
                                        });
                                      }
                                    } else if (widget.choix == 2) {
                                      if (nomI.text != "" &&
                                          nomSocieteI.text != "" &&
                                          fonctionI.text != "" &&
                                          prenomI.text != "" &&
                                          villeI.text != "" &&
                                          sexe != 0 &&
                                          isCheckCondition) {
                                        Map<String, dynamic> body = {
                                          "phone": widget.telephone,
                                          "password": widget.password,
                                          "firstName": prenomI.text,
                                          "nameShop": nomSocieteI.text,
                                          "role": "fournisseur",
                                          "lastName": nomI.text,
                                          "city": villeI.text,
                                          "sexe": sexe == 1 ? "homme" : "femme",
                                          "hasAcceptedNewsletter":
                                              isCheckInformations,
                                          "email": emailI.text
                                        };
                                        print(body);
                                        postResponse(url: '/users', body: body)
                                            .then((value) async {
                                          print(value);

                                          if (value['status'] == 200) {
                                            await SharedPreferences
                                                    .getInstance()
                                                .then((prefs) {
                                              prefs.setString(
                                                  'token',
                                                  value['body']['data']
                                                      ['token']);
                                              prefs.setString(
                                                  'role', "fournisseur");
                                              prefs.setString(
                                                  'nameShop', nomSocieteI.text);
                                            });

                                            Navigator.pushNamed(context, '/');
                                          }
                                        });
                                      }
                                    } else {
                                      Map<String, dynamic> body = {
                                        "username": emailI.text.split("@")[0],
                                        "email": widget.telephone,
                                        "password": widget.password,
                                        "firstName": prenomI.text,
                                        "role": "transporteur",
                                        "lastName": nomI.text,
                                        "City": villeI.text,
                                        "sexe": sexe == 1 ? "homme" : "femme",
                                        "hasAcceptedNewsletter":
                                            isCheckInformations,
                                        "phoneNumber": emailI.text
                                      };
                                      postResponse(
                                              url: 'auth/local/register',
                                              body: body)
                                          .then((value) async {
                                        print(value);

                                        if (value['status'] == 200) {
                                          await SharedPreferences.getInstance()
                                              .then((prefs) {
                                            prefs.setString(
                                                'token', value['body']['jwt']);
                                            prefs.setInt('role', 3);
                                            prefs.setInt('idUser',
                                                value['body']['user']['id']);
                                            prefs.setString(
                                                'name', prenomI.text);
                                          });
                                          Navigator.pushNamed(context, '/');
                                        } else {
                                          setState(() {
                                            isChargement = false;
                                          });
                                        }
                                      });
                                    }
                                  },
                            titre: isChargement ? 'Loading ...' : 'Sign up',
                            bgNormal: widget.choix == 1
                                ? (nomI.text != "" &&
                                        prenomI.text != "" &&
                                        villeI.text != "" &&
                                        sexe != 0 &&
                                        isCheckCondition)
                                    ? 1
                                    : 0
                                : widget.choix == 2
                                    ? (nomI.text != "" &&
                                            nomSocieteI.text != "" &&
                                            fonctionI.text != "" &&
                                            prenomI.text != "" &&
                                            villeI.text != "" &&
                                            sexe != 0 &&
                                            isCheckCondition)
                                        ? 1
                                        : 0
                                    : 0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * .05,
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
