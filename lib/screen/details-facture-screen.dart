import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class DetailsFactureScreen extends StatefulWidget {
  const DetailsFactureScreen({Key? key}) : super(key: key);

  @override
  State<DetailsFactureScreen> createState() => _DetailsFactureScreenState();
}

class _DetailsFactureScreenState extends State<DetailsFactureScreen> {
  late Size size;
  bool isAllSelect = false;
  int isSelect = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        title: Row(
          children: [
            Text(
              'détails factures'.toUpperCase(),
              style: TextStyle(
                fontSize: size.height * .025,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
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
                      "Détails factures du 11 mai 2022",
                      style: TextStyle(
                          fontSize: size.width * .045,
                          color: meuveFonce,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                // Container(
                //   height: size.height * .3,
                //   width: size.width,
                //   child: ProduitHomeWidgetFournisseur(
                //     forDetails: true,
                //     produitModel: ,
                //   ),
                // ),
                SizedBox(
                  height: size.height * .2,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
