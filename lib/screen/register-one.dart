// ignore_for_file: sized_box_for_whitespace

import 'package:deally_app/models/indicatif_by_dii.dart';
import 'package:deally_app/screen/register.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-by-dii.dart';
import 'package:deally_app/widgets/phone-pays-selected.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late _RegisterOneState registerOneState;

class RegisterOne extends StatefulWidget {
  // final int choix;
  const RegisterOne({
    Key? key,
    // required this.choix
  }) : super(key: key);

  @override
  _RegisterOneState createState() {
    registerOneState = _RegisterOneState();
    return registerOneState;
  }
}

class _RegisterOneState extends State<RegisterOne> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focusNodeTelephone = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  bool souvenir = false;
  bool isVidePhone = false;
  bool isVidePassword = false;
  bool isSelectedTelephone = false;
  bool isSelectedPassword = false;
  bool isShowPassword = true;
  int inputType = 0;
  bool viewPhoneIndicatifSelectd = false;
  bool isTelTextVide = false;
  IndicatifByDii indicatifByDiiSelected = listeIndicatif.first;
  bool isInvalidIdentifiant = false;
  bool isChargementBtn = false;
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
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .07,
                                      ),
                                      Icon(
                                        CupertinoIcons.person_alt_circle,
                                        color: meuveFonce,
                                        size: constraints.maxHeight * .07,
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      Text(
                                        'Login'.toUpperCase(),
                                        style: TextStyle(
                                            color: meuveFonce,
                                            fontWeight: FontWeight.w300,
                                            fontSize:
                                                constraints.maxHeight * .04),
                                      )
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
                                                        // ignore: sort_child_properties_last
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
                                                                              "Phone Number",
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
                                                                              '   Phone Number   ',
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
                                                    constraints.maxWidth * .03,
                                              ),
                                              Text(
                                                'Enter a phone number',
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
                                    height: constraints.maxHeight * .05,
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
                                                  isSelectedPassword = true;
                                                });
                                                focusNodePassword
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
                                                            isSelectedPassword
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
                                                                              Text(
                                                                            "Password",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: constraints.maxHeight * .3,
                                                                                color: isVidePassword ? rouge : noir),
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
                                                                                Container(
                                                                                  width: constraints.maxWidth * .9,
                                                                                  height: constraints.maxHeight * .4,
                                                                                  child: Center(
                                                                                    child: TextFormField(
                                                                                      cursorHeight: constraints.maxHeight * .4,
                                                                                      keyboardType: TextInputType.visiblePassword,
                                                                                      focusNode: focusNodePassword,
                                                                                      controller: password,
                                                                                      onChanged: (value) {
                                                                                        setState(() {
                                                                                          isVidePassword = false;
                                                                                        });
                                                                                      },
                                                                                      obscureText: isShowPassword,
                                                                                      style: TextStyle(fontSize: constraints.maxHeight * .25),
                                                                                      decoration: InputDecoration(
                                                                                        hintText: password.text,
                                                                                        hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: constraints.maxHeight * .03),
                                                                                        focusedBorder: InputBorder.none,
                                                                                        errorBorder: InputBorder.none,
                                                                                        enabledBorder: InputBorder.none,
                                                                                        // suffixIcon: Icon(isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )),
                                                                      Positioned(
                                                                        right: constraints.maxWidth *
                                                                            .03,
                                                                        top: constraints.maxHeight *
                                                                            .25,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () =>
                                                                              setState(() {
                                                                            isShowPassword =
                                                                                !isShowPassword;
                                                                          }),
                                                                          child: Icon(isShowPassword
                                                                              ? CupertinoIcons.eye
                                                                              : CupertinoIcons.eye_slash),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                : password.text ==
                                                                        ""
                                                                    ? Container(
                                                                        width: constraints
                                                                            .maxWidth,
                                                                        height:
                                                                            constraints.maxHeight,
                                                                        decoration: BoxDecoration(
                                                                            border: isVidePassword
                                                                                ? Border.all(color: rouge)
                                                                                : Border.all(color: gris),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: constraints.maxWidth * .02,
                                                                            ),
                                                                            Text(
                                                                              '   Password   ',
                                                                              style: TextStyle(
                                                                                  fontSize: constraints.maxHeight * .3,
                                                                                  color: isSelectedPassword
                                                                                      ? meuveFonce
                                                                                      : isVidePassword
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
                                                                            '   ${password.text}   ',
                                                                            style: TextStyle(
                                                                                fontSize: constraints.maxHeight * .3,
                                                                                color: isSelectedPassword ? meuveFonce : noir,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FontStyle.normal),
                                                                          ),
                                                                        ],
                                                                      ),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: isSelectedPassword
                                                                    ? isVidePassword
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
                                        if (isVidePassword)
                                          Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .03,
                                              ),
                                              Text(
                                                'Enter your password',
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
                                  if (isInvalidIdentifiant)
                                    Container(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: constraints.maxHeight * .02,
                                          ),
                                          Text(
                                            "Invalid username or password.",
                                            style: TextStyle(
                                                fontSize:
                                                    constraints.maxHeight *
                                                        .035,
                                                color: rouge),
                                          ),
                                        ],
                                      ),
                                    ),
                                  SizedBox(
                                    height: constraints.maxHeight * .05,
                                  ),
                                  Row(
                                    children: [
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/recouver-password");
                                        },
                                        child: Text(
                                          'Forgot your password ?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: meuveFonce.withOpacity(.7),
                                              fontSize:
                                                  constraints.maxHeight * .03),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .06,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .04,
                                      ),
                                      Text(
                                        'Remember me ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),
                                      Spacer(),
                                      Container(
                                          height: constraints.maxHeight * .06,
                                          width: constraints.maxWidth * .2,
                                          child: Center(
                                              child: Switch(
                                                  activeColor: meuveFonce,
                                                  value: souvenir,
                                                  onChanged: (t) {
                                                    setState(() {
                                                      souvenir = !souvenir;
                                                    });
                                                  }))),
                                      // SizedBox(width: MediaQuery.of(context).size.width * .05,)
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
                                          onTap: () async {
                                            if (telephone.text == "") {
                                              setState(() {
                                                isVidePhone = true;
                                              });
                                            }
                                            if (password.text == "") {
                                              setState(() {
                                                isVidePassword = true;
                                              });
                                            }
                                            if (telephone.text != "" &&
                                                password.text != "") {
                                              setState(() {
                                                isVidePassword = false;
                                                isVidePhone = false;
                                              });
                                              setState(() {
                                                isChargementBtn = true;
                                              });
                                              postResponse(
                                                  url: "/users/auth",
                                                  body: {
                                                    "password": password.text,
                                                    "phone":
                                                        indicatifByDiiSelected
                                                                .indicatif +
                                                            telephone.text
                                                  }).then((value) async {
                                                if (value['status'] == 200) {
                                                  await SharedPreferences
                                                          .getInstance()
                                                      .then((prefs) {
                                                    prefs.setString(
                                                        'token',
                                                        value['body']['data']
                                                            ['token']);

                                                    prefs.setString(
                                                        'role',
                                                        value['body']['data']
                                                            ['user']['role']);
                                                  });
                                                  Navigator.pushNamed(
                                                      context, '/');
                                                } else {
                                                  setState(() {
                                                    isInvalidIdentifiant = true;
                                                    isChargementBtn = false;
                                                  });
                                                }
                                              });
                                            } else {}
                                          },
                                          titre: isChargementBtn
                                              ? 'Loading ...'
                                              : 'Login',
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .13,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width,
                        color: blanc,
                        child: Column(
                          children: [
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  color: meuveFonce,
                                ),
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width * .1,
                                  child: Center(
                                    child: Text(
                                      'OR',
                                      style: TextStyle(color: meuveFonce),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  color: meuveFonce,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.width * .4,
                              child: BtnByDii(
                                haveBg: false,
                                titre: 'Sign up',
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterNormal())),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          children: listeIndicatif
                              .where((element) =>
                                  element != indicatifByDiiSelected)
                              .map(
                                (e) => Container(
                                  height: constraints.maxHeight * .1,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      indicatifByDiiSelected = e;
                                      viewPhoneIndicatifSelectd =
                                          !viewPhoneIndicatifSelectd;
                                    }),
                                    child: PhonePaysSelcted(
                                      indicatif: e.indicatif,
                                      nom: e.pays,
                                      urlImage: e.url,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
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
