import 'package:deally_app/screen/adresse-livraison-screen.dart';
import 'package:deally_app/screen/commercants/compte-ui/info-perso.dart';
import 'package:deally_app/screen/commercants/compte-ui/paiement-scren.dart';
import 'package:deally_app/screen/politique-confidentialite.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/btn-widget-compte.dart';
import 'package:flutter/material.dart';

class MonCompteScreen extends StatefulWidget {
  const MonCompteScreen({Key? key}) : super(key: key);

  @override
  State<MonCompteScreen> createState() => _MonCompteScreenState();
}

class _MonCompteScreenState extends State<MonCompteScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
      ),
      backgroundColor: blanc,
      body: ListView(
        children: [
          SizedBox(
            height: size.height * .03,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .05,
              ),
              Text(
                'My account',
                style: TextStyle(
                    fontSize: size.height * .025,
                    fontWeight: FontWeight.w300,
                    color: meuveFonce),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            height: size.height * .06,
            width: size.width * .9,
            child: BtnWidgetCompte(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InfoPersonnel())),
                text: "My company profile",
                bgColor: gris.withOpacity(.4)),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            height: size.height * .06,
            width: size.width * .9,
            child: BtnWidgetCompte(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaiementScreen())),
                text: "Payment methods",
                bgColor: gris.withOpacity(.4)),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            height: size.height * .06,
            width: size.width * .9,
            child: BtnWidgetCompte(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdresseLivraisonScreen(
                              textAdress: "Delivery Address",
                            ))),
                text: "My adresses",
                bgColor: gris.withOpacity(.4)),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Container(
            color: gris.withOpacity(.4),
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .06,
                  width: size.width * .9,
                  child: BtnWidgetCompte(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PolitiqueConfidentialite(
                                    title: "General terms of use",
                                  ))),
                      text: "General terms of use",
                      bgColor: blanc),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .06,
                  width: size.width * .9,
                  child: BtnWidgetCompte(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PolitiqueConfidentialite(
                                    title: "Privacy Policy",
                                  ))),
                      text: "Privacy Policy",
                      bgColor: blanc),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .06,
                  width: size.width * .9,
                  child: BtnWidgetCompte(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PolitiqueConfidentialite(
                                    title: "Terms of purchase ",
                                  ))),
                      text: "Terms of purchase ",
                      bgColor: blanc),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .06,
                  width: size.width * .9,
                  child: BtnWidgetCompte(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PolitiqueConfidentialite(
                                    title: "Politique des cookies",
                                  ))),
                      text: "politique des cookies",
                      bgColor: blanc),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .05),
          Row(
            children: [
              SizedBox(
                width: size.width * .05,
              ),
              Container(
                  height: size.height * .06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: gris.withOpacity(.4)),
                  child: Center(
                    child: Text(
                      '      Unsubscribe     ',
                      style: TextStyle(
                          color: meuveFonce, fontWeight: FontWeight.w300),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: size.height * .05,
          ),
        ],
      ),
    );
  }
}
