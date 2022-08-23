// ignore_for_file: sort_child_properties_last

import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/fournisseur/home-page-screen.dart';
import 'package:deally_app/screen/home-page-screen.dart';
import 'package:deally_app/screen/suivi-commande-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/produit-home-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PayementReussiScreen extends StatefulWidget {
  final String id;
  const PayementReussiScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PayementReussiScreen> createState() => _PayementReussiScreenState();
}

class _PayementReussiScreenState extends State<PayementReussiScreen> {
  late Size size;
  String ref = "";
  List<Container> listeWidget = [];
  List<ProduitModel> listeProduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrder();
    getProductSimillaire();
  }

  getOrder() async {
    await getResponse(url: '/orders/' + widget.id).then((value) {
      print(value);
      setState(() {
        ref = value['data']['reference'];
      });
    });
  }

  getProductSimillaire() async {
    await getResponse(url: "/products").then((value) {
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProduitHomeWidget(
                    produitModel: e,
                  ),
                )),
              ),
            )
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            Positioned(
                top: 0,
                child: SizedBox(
                    height: size.height * .95,
                    width: size.width,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return ListView(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * .05,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .2,
                              ),
                              Icon(
                                Icons.check_circle,
                                size: constraints.maxWidth * .05,
                                color: meuveFonce,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              ),
                              Text(
                                "Successful payment",
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .025,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              )
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Container(
                            width: constraints.maxWidth * .7,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Thank you for your purchase .',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    'Your order number is : ',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .01,
                                  ),
                                  Text(
                                    '$ref',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        color: meuveFonce,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .1,
                              ),
                              Text(
                                'Recommended for you ',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .025,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: constraints.maxHeight * .4,
                                  width: constraints.maxWidth,
                                  child: ListView(
                                    children: listeWidget,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .1,
                          )
                        ],
                      );
                    }))),
            Positioned(
                bottom: size.height * .02,
                left: size.width * .1,
                child: Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageScreen())),
                        child: Container(
                          height: size.height * .05,
                          width: size.width * .8,
                          child: Center(
                            child: Text(
                              'Continue shopping'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: size.height * .012, color: blanc),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: noir,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuiviCommande())),
                        child: Container(
                          height: size.height * .05,
                          width: size.width * .8,
                          // ignore: sort_child_properties_last
                          child: Center(
                            child: Text(
                              'Check my order'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: size.height * .012, color: blanc),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: meuveFonce,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
