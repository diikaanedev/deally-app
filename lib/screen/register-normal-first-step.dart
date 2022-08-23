import 'package:deally_app/models/indicatif_by_dii.dart';
import 'package:deally_app/screen/register-normal-second-step.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/make-start-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/phone-pays-selected.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late _RegisterFirstStepState registerFirstStepState;

class RegisterFirstStep extends StatefulWidget {
  final int choix;
  const RegisterFirstStep({Key? key, required this.choix}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _RegisterFirstStepState createState() {
    registerFirstStepState = _RegisterFirstStepState();
    return registerFirstStepState;
  }
}

class _RegisterFirstStepState extends State<RegisterFirstStep> {
  late Size size;
  late int choix;
  final _formKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode focusNodeTelephone = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();
  bool souvenir = false;
  bool isVidePhone = false;
  bool isVidePassword = false;
  bool isVideConfirmPassword = false;
  bool isSelectedTelephone = false;
  bool isSelectedPassword = false;
  bool isSelectedConfirmPassword = false;
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;
  int inputType = 0;
  bool viewPhoneIndicatifSelectd = false;
  bool isTelTextVide = false;
  bool isreverse = false;
  IndicatifByDii indicatifByDiiSelected = listeIndicatif.first;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    choix = widget.choix;
  }

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
        shrinkWrap: true,
        reverse: isreverse,
        children: [
          Stack(
            children: [
              // Container(
              //   height: size.height,
              //   width: size.width,
              // ),
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
                          color: meuveFonce,
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
                          style: TextStyle(
                              fontSize: size.width * .03, color: noir),
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Text(
                          '2. My informations',
                          style: TextStyle(
                              fontSize: size.width * .03, color: gris),
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
                          "Quick and free to sign up !",
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
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
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
                                        isSelectedConfirmPassword = false;
                                        isSelectedPassword = false;
                                      });
                                      focusNodeTelephone.requestFocus();
                                    },
                                    child: Container(
                                        height: constraints.maxHeight * .95,
                                        width: constraints.maxWidth * .94,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Container(
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              // ignore: sort_child_properties_last
                                              child: isSelectedTelephone
                                                  ? Stack(
                                                      children: [
                                                        Container(
                                                          height: constraints
                                                              .maxHeight,
                                                          width: constraints
                                                              .maxWidth,
                                                        ),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .02,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .02,
                                                            child: Container(
                                                              child: Text(
                                                                "Phone number",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            .3,
                                                                    color: isVidePhone
                                                                        ? rouge
                                                                        : noir),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .4,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .03,
                                                            child: Container(
                                                              height: constraints
                                                                      .maxHeight *
                                                                  .5,
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .95,
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        viewPhoneIndicatifSelectd =
                                                                            !viewPhoneIndicatifSelectd;
                                                                      });
                                                                      focusNodeTelephone
                                                                          .unfocus();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          constraints.maxHeight *
                                                                              .5,
                                                                      width:
                                                                          constraints.maxWidth *
                                                                              .2,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                constraints.maxHeight * .4,
                                                                            width:
                                                                                constraints.maxWidth * .05,
                                                                            child:
                                                                                Image.asset(indicatifByDiiSelected.url),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                            indicatifByDiiSelected.indicatif,
                                                                            style: TextStyle(
                                                                                fontSize: constraints.maxHeight * .25,
                                                                                fontWeight: FontWeight.w300,
                                                                                color: isVidePhone ? rouge : noir),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: constraints
                                                                            .maxWidth *
                                                                        .7,
                                                                    height:
                                                                        constraints.maxHeight *
                                                                            .4,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          TextFormField(
                                                                        cursorHeight:
                                                                            constraints.maxHeight *
                                                                                .4,
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        focusNode:
                                                                            focusNodeTelephone,
                                                                        controller:
                                                                            telephone,
                                                                        onChanged:
                                                                            (value) =>
                                                                                setState(() {
                                                                          isVidePhone =
                                                                              false;
                                                                        }),
                                                                        obscureText:
                                                                            false,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                constraints.maxHeight * .25),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              telephone.text,
                                                                          hintStyle: TextStyle(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: constraints.maxHeight * .03),
                                                                          focusedBorder:
                                                                              InputBorder.none,
                                                                          enabledBorder:
                                                                              InputBorder.none,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    )
                                                  : telephone.text == ""
                                                      ? Container(
                                                          width: constraints
                                                              .maxWidth,
                                                          height: constraints
                                                              .maxHeight,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: isVidePhone
                                                                      ? rouge
                                                                      : gris),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: constraints
                                                                        .maxWidth *
                                                                    .02,
                                                              ),
                                                              Text(
                                                                '   Phone number   ',
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
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .02,
                                                            ),
                                                            Text(
                                                              '  ${indicatifByDiiSelected.indicatif}${telephone.text}   ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .2,
                                                                  color: isSelectedTelephone
                                                                      ? meuveFonce
                                                                      : noir,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
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
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                      width: constraints.maxWidth * .03,
                                    ),
                                    Text(
                                      'Enter a phone number',
                                      style: TextStyle(
                                          color: rouge,
                                          fontWeight: FontWeight.w300,
                                          fontSize:
                                              constraints.maxHeight * .03),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Column(
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
                                        isSelectedConfirmPassword = false;
                                        isSelectedTelephone = false;
                                      });
                                      focusNodePassword.requestFocus();
                                    },
                                    child: Container(
                                        height: constraints.maxHeight * .95,
                                        width: constraints.maxWidth * .94,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Container(
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              child: isSelectedPassword
                                                  ? Stack(
                                                      children: [
                                                        Container(
                                                          height: constraints
                                                              .maxHeight,
                                                          width: constraints
                                                              .maxWidth,
                                                        ),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .02,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .02,
                                                            child: Container(
                                                              child: Text(
                                                                "Password",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            .3,
                                                                    color: isVidePassword
                                                                        ? rouge
                                                                        : noir),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .4,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .03,
                                                            child: Container(
                                                              height: constraints
                                                                      .maxHeight *
                                                                  .5,
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .95,
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: constraints
                                                                            .maxWidth *
                                                                        .9,
                                                                    height:
                                                                        constraints.maxHeight *
                                                                            .4,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          TextFormField(
                                                                        cursorHeight:
                                                                            constraints.maxHeight *
                                                                                .4,
                                                                        keyboardType:
                                                                            TextInputType.visiblePassword,
                                                                        focusNode:
                                                                            focusNodePassword,
                                                                        controller:
                                                                            password,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            isVidePassword =
                                                                                false;
                                                                          });
                                                                        },
                                                                        obscureText:
                                                                            isShowPassword,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                constraints.maxHeight * .25),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              password.text,
                                                                          hintStyle: TextStyle(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: constraints.maxHeight * .03),
                                                                          focusedBorder:
                                                                              InputBorder.none,
                                                                          errorBorder:
                                                                              InputBorder.none,
                                                                          enabledBorder:
                                                                              InputBorder.none,
                                                                          // suffixIcon: Icon(isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Positioned(
                                                          right: constraints
                                                                  .maxWidth *
                                                              .03,
                                                          top: constraints
                                                                  .maxHeight *
                                                              .25,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                setState(() {
                                                              isShowPassword =
                                                                  !isShowPassword;
                                                            }),
                                                            child: Icon(isShowPassword
                                                                ? CupertinoIcons
                                                                    .eye
                                                                : CupertinoIcons
                                                                    .eye_slash),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : password.text == ""
                                                      ? Container(
                                                          width: constraints
                                                              .maxWidth,
                                                          height: constraints
                                                              .maxHeight,
                                                          decoration: BoxDecoration(
                                                              border: isVidePassword
                                                                  ? Border.all(
                                                                      color:
                                                                          rouge)
                                                                  : Border.all(
                                                                      color:
                                                                          gris),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: constraints
                                                                        .maxWidth *
                                                                    .02,
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
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .02,
                                                            ),
                                                            Text(
                                                              '   ${makeString2Start(password.text)}   ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .3,
                                                                  color: isSelectedPassword
                                                                      ? meuveFonce
                                                                      : noir,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
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
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                      width: constraints.maxWidth * .03,
                                    ),
                                    Text(
                                      'Enter your password',
                                      style: TextStyle(
                                          color: rouge,
                                          fontWeight: FontWeight.w300,
                                          fontSize:
                                              constraints.maxHeight * .03),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .03,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelectedConfirmPassword = true;
                                        isSelectedPassword = false;
                                        isSelectedTelephone = false;
                                      });
                                      focusNodeConfirmPassword.requestFocus();
                                    },
                                    child: Container(
                                        height: constraints.maxHeight * .95,
                                        width: constraints.maxWidth * .94,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Container(
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              child: isSelectedConfirmPassword
                                                  ? Stack(
                                                      children: [
                                                        Container(
                                                          height: constraints
                                                              .maxHeight,
                                                          width: constraints
                                                              .maxWidth,
                                                        ),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .02,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .02,
                                                            child: Container(
                                                              child: Text(
                                                                "Renew password ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            .3,
                                                                    color: isVideConfirmPassword
                                                                        ? rouge
                                                                        : noir),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            top: constraints
                                                                    .maxHeight *
                                                                .4,
                                                            left: constraints
                                                                    .maxWidth *
                                                                .03,
                                                            child: Container(
                                                              height: constraints
                                                                      .maxHeight *
                                                                  .5,
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .95,
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: constraints
                                                                            .maxWidth *
                                                                        .9,
                                                                    height:
                                                                        constraints.maxHeight *
                                                                            .4,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          TextFormField(
                                                                        cursorHeight:
                                                                            constraints.maxHeight *
                                                                                .4,
                                                                        keyboardType:
                                                                            TextInputType.visiblePassword,
                                                                        focusNode:
                                                                            focusNodeConfirmPassword,
                                                                        controller:
                                                                            confirmPassword,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            isVideConfirmPassword =
                                                                                false;
                                                                          });
                                                                        },
                                                                        obscureText:
                                                                            isShowConfirmPassword,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                constraints.maxHeight * .25),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              confirmPassword.text,
                                                                          hintStyle: TextStyle(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: constraints.maxHeight * .03),
                                                                          focusedBorder:
                                                                              InputBorder.none,
                                                                          errorBorder:
                                                                              InputBorder.none,
                                                                          enabledBorder:
                                                                              InputBorder.none,
                                                                          // suffixIcon: Icon(isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        Positioned(
                                                          right: constraints
                                                                  .maxWidth *
                                                              .03,
                                                          top: constraints
                                                                  .maxHeight *
                                                              .25,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                setState(() {
                                                              isShowConfirmPassword =
                                                                  !isShowConfirmPassword;
                                                            }),
                                                            child: Icon(isShowConfirmPassword
                                                                ? CupertinoIcons
                                                                    .eye
                                                                : CupertinoIcons
                                                                    .eye_slash),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : confirmPassword.text == ""
                                                      ? Container(
                                                          width: constraints
                                                              .maxWidth,
                                                          height: constraints
                                                              .maxHeight,
                                                          decoration: BoxDecoration(
                                                              border: isVideConfirmPassword
                                                                  ? Border.all(
                                                                      color:
                                                                          rouge)
                                                                  : Border.all(
                                                                      color:
                                                                          gris),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: constraints
                                                                        .maxWidth *
                                                                    .02,
                                                              ),
                                                              Text(
                                                                ' Renew password    ',
                                                                style: TextStyle(
                                                                    fontSize: constraints.maxHeight * .3,
                                                                    color: isSelectedConfirmPassword
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
                                                              width: constraints
                                                                      .maxWidth *
                                                                  .02,
                                                            ),
                                                            Text(
                                                              '   ${makeString2Start(confirmPassword.text)}   ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .3,
                                                                  color: isSelectedConfirmPassword
                                                                      ? meuveFonce
                                                                      : noir,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
                                                            ),
                                                          ],
                                                        ),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          isSelectedConfirmPassword
                                                              ? isVideConfirmPassword
                                                                  ? rouge
                                                                  : meuveFonce
                                                              : gris),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            );
                                          },
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .01,
                              ),
                              if (isVideConfirmPassword)
                                Row(
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth * .03,
                                    ),
                                    Text(
                                      'Renew passwords',
                                      style: TextStyle(
                                          color: rouge,
                                          fontWeight: FontWeight.w300,
                                          fontSize:
                                              constraints.maxHeight * .03),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
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
                          height: size.height * .07,
                          width: size.width * .94,
                          child: BtnByDiiConnexion(
                            onTap: () {
                              if (telephone.text != "" &&
                                  password.text != "" &&
                                  password.text == confirmPassword.text) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterSecondStep(
                                              choix: choix,
                                              telephone: indicatifByDiiSelected
                                                      .indicatif +
                                                  telephone.text,
                                              password: password.text,
                                            )));
                              }
                            },
                            titre: 'Next',
                            bgNormal: (telephone.text != "" &&
                                    password.text != "" &&
                                    password.text == confirmPassword.text)
                                ? 1
                                : 0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
              if (viewPhoneIndicatifSelectd)
                Positioned(
                    top: MediaQuery.of(context).size.height * .32,
                    left: MediaQuery.of(context).size.width * .03,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .45,
                      width: MediaQuery.of(context).size.width * .94,
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
        ],
      ),
    );
  }
}
