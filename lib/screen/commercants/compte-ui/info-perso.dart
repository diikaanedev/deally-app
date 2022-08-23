import 'package:deally_app/models/indicatif_by_dii.dart';
import 'package:deally_app/screen/commercants/compte-ui/forget-password.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-input-by-dii.dart';
import 'package:deally_app/widgets/btn-widget-compte.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPersonnel extends StatefulWidget {
  const InfoPersonnel({Key? key}) : super(key: key);

  @override
  State<InfoPersonnel> createState() => _InfoPersonnelState();
}

class _InfoPersonnelState extends State<InfoPersonnel> {
  late Size size;
  late int choix;
  final _formKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController cac = TextEditingController();
  TextEditingController cacNumber = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController nomI = TextEditingController();
  TextEditingController prenomI = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  getInfo() async {
    await getResponse(url: '/users').then((value) {
      print(value);
      setState(() {
        telephone.text = value['data']['user']['phone'];
        cac.text = value['data']['user']['cacName'];
        cacNumber.text = value['data']['user']['cacNumber'];
        bvn.text = value['data']['user']['bvn'];
        nomI.text = value['data']['user']['firstName'] ?? '';
        prenomI.text = value['data']['user']['lastName'] ?? '';
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
                    "My personal information",
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
                  'Make sure your information is the same as on your ID',
                  style: TextStyle(
                      fontSize: 14, color: noir, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'Last name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: prenomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'First name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cac,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'CAC registration Name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cacNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'CAC registration Number ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: bvn,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'BVN Bussiness ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: telephone,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  child: BtnWidgetCompte(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassword())),
                      text: "Change my password",
                      bgColor: gris.withOpacity(.4)),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .07,
                  child: BtnByDiiConnexion(
                      titre: "Save",
                      onTap: () async {
                        putResponse(url: '/users', body: {
                          "firstName": nomI.text,
                          "lastName": prenomI.text,
                          "cacName": cac.text,
                          "cacNumber": cacNumber.text,
                          "bvn": bvn.text,
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
