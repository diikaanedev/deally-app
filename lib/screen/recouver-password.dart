import 'package:deally_app/models/indicatif_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/phone-pays-selected.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late _RecouverPasswordState recouverPasswordState;

class RecouverPassword extends StatefulWidget {
  const RecouverPassword({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _RecouverPasswordState createState() {
    recouverPasswordState = _RecouverPasswordState();
    return recouverPasswordState;
  }
}

class _RecouverPasswordState extends State<RecouverPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focusNodeTelephone = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  bool souvenir = false;
  bool isVidePhone = false;
  bool isVidePassword = false;
  int inputType = 1;
  bool viewPhoneIndicatifSelectd = false;
  bool isSelectedTelephone = false;
  IndicatifByDii indicatifByDiiSelected = listeIndicatif.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: .0,
          elevation: .0,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: meuveClair,
        body: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .3,
                  left: -(MediaQuery.of(context).size.width * .9),
                  child: Image.asset(
                    "assets/images/bg-sododin.png",
                  )),
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    reverse: false,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .45,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration: BoxDecoration(
                              color: blanc,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                    color: Colors.black.withOpacity(.3))
                              ]),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight * .06,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: constraints.maxWidth * .07,
                                  //     ),
                                  //     Icon(
                                  //       CupertinoIcons.person_alt_circle,
                                  //       color: meuveFonce,
                                  //       size: constraints.maxHeight * .07,
                                  //     ),
                                  //     SizedBox(
                                  //       width: constraints.maxWidth * .02,
                                  //     ),
                                  //     Text(
                                  //       'Connexion'.toUpperCase(),
                                  //       style: TextStyle(
                                  //           color: meuveFonce,
                                  //           fontWeight: FontWeight.w300,
                                  //           fontSize:
                                  //               constraints.maxHeight * .04),
                                  //     )
                                  //   ],
                                  // ),
                                  Text(
                                    'récupérer'.toUpperCase(),
                                    style: TextStyle(
                                        color: meuveFonce,
                                        fontWeight: FontWeight.w300,
                                        fontSize: constraints.maxHeight * .05),
                                  ),
                                  Text(
                                    'mon mot de passe'.toUpperCase(),
                                    style: TextStyle(
                                        color: meuveFonce,
                                        fontWeight: FontWeight.w300,
                                        fontSize: constraints.maxHeight * .05),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .03,
                                      ),
                                      Text(
                                        'Renseignez les informations ci-dessus',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .035,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .03,
                                      ),
                                      Text(
                                        'Nous vous  enverrons un sms avec un lien pour',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .035,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .04,
                                      ),
                                      Text(
                                        'récupérer l\'accès à votre compte Sodidin',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxHeight * .035,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .06,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth * .03,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSelectedTelephone = true;
                                                });
                                                focusNodeTelephone
                                                    .requestFocus();
                                              },
                                              child: Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          .13,
                                                  width: constraints.maxWidth *
                                                      .94,
                                                  child: LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      return Container(
                                                        height: constraints
                                                            .maxHeight,
                                                        width: constraints
                                                            .maxWidth,
                                                        child:
                                                            isSelectedTelephone
                                                                ? Stack(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            constraints.maxHeight,
                                                                        width: constraints
                                                                            .maxWidth,
                                                                      ),
                                                                      Positioned(
                                                                          top: constraints.maxHeight *
                                                                              .02,
                                                                          left: constraints.maxWidth *
                                                                              .02,
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Text(
                                                                              "Téléphone",
                                                                              style: TextStyle(fontWeight: FontWeight.w300, fontSize: constraints.maxHeight * .3, color: isVidePhone ? rouge : noir),
                                                                            ),
                                                                          )),
                                                                      Positioned(
                                                                          top: constraints.maxHeight *
                                                                              .4,
                                                                          left: constraints.maxWidth *
                                                                              .03,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                constraints.maxHeight * .5,
                                                                            width:
                                                                                constraints.maxWidth * .95,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      viewPhoneIndicatifSelectd = !viewPhoneIndicatifSelectd;
                                                                                    });
                                                                                    focusNodeTelephone.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: constraints.maxHeight * .5,
                                                                                    width: constraints.maxWidth * .2,
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          height: constraints.maxHeight * .4,
                                                                                          width: constraints.maxWidth * .05,
                                                                                          child: Image.asset(indicatifByDiiSelected.url),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 4,
                                                                                        ),
                                                                                        Text(
                                                                                          indicatifByDiiSelected.indicatif,
                                                                                          style: TextStyle(fontSize: constraints.maxHeight * .25, fontWeight: FontWeight.w300, color: isVidePhone ? rouge : noir),
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
                                                                                      cursorHeight: constraints.maxHeight * .4,
                                                                                      keyboardType: TextInputType.phone,
                                                                                      focusNode: focusNodeTelephone,
                                                                                      controller: telephone,
                                                                                      onChanged: (value) => setState(() {
                                                                                        isVidePhone = false;
                                                                                      }),
                                                                                      obscureText: false,
                                                                                      style: TextStyle(fontSize: constraints.maxHeight * .25),
                                                                                      decoration: InputDecoration(
                                                                                        hintText: telephone.text,
                                                                                        hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: constraints.maxHeight * .03),
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
                                                                : telephone.text ==
                                                                        ""
                                                                    ? Container(
                                                                        width: constraints
                                                                            .maxWidth,
                                                                        height:
                                                                            constraints.maxHeight,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: isVidePhone ? rouge : gris),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: constraints.maxWidth * .02,
                                                                            ),
                                                                            Text(
                                                                              '   Téléphone   ',
                                                                              style: TextStyle(
                                                                                  fontSize: constraints.maxHeight * .3,
                                                                                  color: isSelectedTelephone
                                                                                      ? meuveFonce
                                                                                      : isVidePhone
                                                                                          ? rouge
                                                                                          : noir,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FontStyle.normal),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                constraints.maxWidth * .02,
                                                                          ),
                                                                          Text(
                                                                            '   ${telephone.text}   ',
                                                                            style: TextStyle(
                                                                                fontSize: constraints.maxHeight * .3,
                                                                                color: isSelectedTelephone ? meuveFonce : noir,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FontStyle.normal),
                                                                          ),
                                                                        ],
                                                                      ),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: isSelectedTelephone
                                                                    ? isVidePhone
                                                                        ? rouge
                                                                        : meuveFonce
                                                                    : gris),
                                                            borderRadius: BorderRadius.circular(8)),
                                                      );
                                                    },
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * .01,
                                        ),
                                        if (isVidePhone)
                                          Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              ),
                                              Text(
                                                'Saissisez un numéro de téléphone',
                                                style: TextStyle(
                                                    color: rouge,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        constraints.maxHeight *
                                                            .03),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: constraints.maxHeight * .06,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .03,
                                      ),
                                      Container(
                                        height: constraints.maxHeight * .13,
                                        width: constraints.maxWidth * .94,
                                        child: BtnByDiiConnexion(
                                          onTap: () {
                                            Navigator.pop(context, true);
                                          },
                                          titre: 'revenir à la connexion',
                                          bgNormal: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .06,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .03,
                                      ),
                                      Container(
                                        height: constraints.maxHeight * .13,
                                        width: constraints.maxWidth * .94,
                                        child: BtnByDiiConnexion(
                                          onTap: () {
                                            if (telephone.text == "") {
                                              setState(() {
                                                isVidePhone = true;
                                              });
                                            } else {}
                                          },
                                          titre: 'Connexion',
                                          bgNormal: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //     bottom: 0,
              //     child: Container(
              //       height: MediaQuery.of(context).size.height * .3,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //         // color: blanc,
              //           gradient: LinearGradient(
              //             tileMode: TileMode.mirror ,
              //             colors: [
              //               blanc,
              //               meuveClair
              //       ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
              //     )),
              if (viewPhoneIndicatifSelectd)
                Positioned(
                    top: MediaQuery.of(context).size.height * .245,
                    left: MediaQuery.of(context).size.width * .15,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .45,
                      width: MediaQuery.of(context).size.width * .7,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "",
                                nom: "A",
                                urlImage: "",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+221",
                                nom: "Sénégal",
                                urlImage: "assets/images/drapeau-senegal.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+225",
                                nom: "Cote d\'ivoire",
                                urlImage:
                                    "assets/images/drapeau-cote-ivoire.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+234",
                                nom: "Nigéria",
                                urlImage: "assets/images/drapeau-nigeria.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+221",
                                nom: "Sénégal",
                                urlImage: "assets/images/drapeau-senegal.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+225",
                                nom: "Cote d\'ivoire",
                                urlImage:
                                    "assets/images/drapeau-cote-ivoire.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+234",
                                nom: "Nigéria",
                                urlImage: "assets/images/drapeau-nigeria.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+221",
                                nom: "Sénégal",
                                urlImage: "assets/images/drapeau-senegal.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+225",
                                nom: "Cote d\'ivoire",
                                urlImage:
                                    "assets/images/drapeau-cote-ivoire.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+234",
                                nom: "Nigéria",
                                urlImage: "assets/images/drapeau-nigeria.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+221",
                                nom: "Sénégal",
                                urlImage: "assets/images/drapeau-senegal.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+225",
                                nom: "Cote d\'ivoire",
                                urlImage:
                                    "assets/images/drapeau-cote-ivoire.png",
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              child: PhonePaysSelcted(
                                indicatif: "+234",
                                nom: "Nigéria",
                                urlImage: "assets/images/drapeau-nigeria.png",
                              ),
                            ),
                          ],
                        );
                      }),
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: meuveFonce),
                            left: BorderSide(color: meuveFonce),
                            right: BorderSide(color: meuveFonce),
                          ),
                          // borderRadius: BorderRadius.circular(10),
                          color: blanc),
                    )),
            ],
          ),
        ));
  }
}
