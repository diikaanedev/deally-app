import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-input-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late Size size;
  late int choix;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailI = TextEditingController();

  FocusNode email = FocusNode();

  int inputType = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  getInfo() async {
    await SharedPreferences.getInstance().then((prefs) async {
      await getResponse(url: 'users/${prefs.getInt('idUser')}').then((value) {
        setState(() {
          emailI.text = value['phoneNumber'] ?? '';
        });
      });
    });
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
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            reverse: false,
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Text(
                    "Change my password",
                    style: TextStyle(
                        fontSize: 18,
                        color: meuveFonce,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * .05),
                child: Text(
                  'put your email and we will send you a password',
                  style: TextStyle(
                      fontSize: 14, color: noir, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .06,
                  width: size.width * .9,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: BtnInputByDii(
                              titre: "email",
                              // messageVide: "Saissisez votre nom de famille",
                              pattern: r'(^[a-zA-Z ]*$)',
                              typeKeyboard: TextInputType.emailAddress,
                              focusNode: email,
                              controller: emailI,
                              // choix: 1,
                              haveBg: inputType == 1,
                              ontap: () {
                                setState(() {
                                  inputType = 1;
                                });
                                email.requestFocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .3,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .07,
                  child: BtnByDiiConnexion(
                      titre: "Save",
                      onTap: () async {
                        postResponse(url: 'auth/forgot-password', body: {
                          "data": {"email": emailI.text}
                        }).then((value) {
                          print(value);
                          Navigator.pop(context, true);
                        });
                      },
                      bgNormal: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
