import 'package:deally_app/screen/facture-screen.dart';
import 'package:deally_app/screen/suivi-commande-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/btn-widget-compte.dart';
import 'package:flutter/material.dart';

class MesCommandesScreen extends StatefulWidget {
  const MesCommandesScreen({Key? key}) : super(key: key);

  @override
  State<MesCommandesScreen> createState() => _MesCommandesScreenState();
}

class _MesCommandesScreenState extends State<MesCommandesScreen> {
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
      body: Column(
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
                'My orders',
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
                        builder: (context) => const SuiviCommande())),
                text: "Track my orders",
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
                        builder: (context) => const FactureScreen())),
                text: "My bills",
                bgColor: gris.withOpacity(.4)),
          ),
          SizedBox(
            height: size.height * .02,
          ),
        ],
      ),
    );
  }
}
