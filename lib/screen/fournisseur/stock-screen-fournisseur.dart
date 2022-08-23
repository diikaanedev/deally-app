import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-one.dart';
import 'package:deally_app/screen/fournisseur/order-prepare.dart';
import 'package:deally_app/screen/valid-commende-fournisseur.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-widget-compte.dart';
import 'package:deally_app/widgets/fournisseur/produit-home-widget-fournisseur.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii-fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

class StockScreenFournisseur extends StatefulWidget {
  const StockScreenFournisseur({Key? key}) : super(key: key);

  @override
  State<StockScreenFournisseur> createState() => _StockScreenFournisseurState();
}

class _StockScreenFournisseurState extends State<StockScreenFournisseur> {
  late Size size;
  late Coordinates coordinates;
  List<ProduitModel> listeProduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  getProduct() async {
    await getResponse(url: '/products').then((value) {
      // print(value['data'][0]['attributes']['image']['data']);
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height * .25,
            width: size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 30,
                      color: blanc,
                    ),
                    SizedBox(
                      width: size.width * .05,
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "Inventory management",
                  style: TextStyle(
                      fontSize: size.height * .035,
                      color: blanc,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/stock.jpeg"),
                    fit: BoxFit.cover)),
          )),
          Positioned(
              top: size.height * .25,
              child: Container(
                height: size.height * .75,
                width: size.width,
                child: ListView(
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
                          'My orders to prepare',
                          style: TextStyle(
                              fontSize: size.height * .025,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: size.height * .02,
                    // ),
                    // Center(
                    //   child: Container(
                    //     height: size.height * .4,
                    //     width: size.width * .9,
                    //     child: ValidCommandeFournisseur(),
                    //     decoration: BoxDecoration(
                    //         color: gris,
                    //         borderRadius: BorderRadius.circular(10)),
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                      child: Container(
                        height: size.height * .06,
                        width: size.width * .9,
                        child: BtnWidgetCompte(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OrderPrepare(),
                                )),
                            text: "See all my orders to prepare",
                            bgColor: gris.withOpacity(.4)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'My sales by warehouse',
                          style: TextStyle(
                              fontSize: size.height * .025,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                      child: Container(
                        height: size.height * .06,
                        width: size.width * .9,
                        child: BtnWidgetCompte(
                            onTap: () => {},
                            text: "Main warehouse",
                            bgColor: gris.withOpacity(.4)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                      child: Container(
                        height: size.height * .06,
                        width: size.width * .9,
                        child: BtnWidgetCompte(
                            onTap: () => {},
                            text: "Secondary warehouse",
                            bgColor: gris.withOpacity(.4)),
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * .02,
                    // ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: size.width * .05,
                    //     ),
                    //     Text(
                    //       'Your expired products, to be renewed',
                    //       style: TextStyle(
                    //           fontSize: size.height * .025,
                    //           fontWeight: FontWeight.w300),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: size.height * .02,
                    // ),
                    // Center(
                    //   child: SizedBox(
                    //     height: size.height * .5,
                    //     width: size.width * .95,
                    //     child: GridView.count(
                    //       crossAxisSpacing: 8,
                    //       mainAxisSpacing: 8,
                    //       childAspectRatio: .7,
                    //       crossAxisCount: 2,
                    //       children: listeProduct
                    //           .map(
                    //             (e) => Container(
                    //               width: size.width * .45,
                    //               child: Center(
                    //                   child: ProduitHomeWidgetFournisseur(
                    //                 produitModel: e,
                    //               )),
                    //             ),
                    //           )
                    //           .toList(),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height * .15,
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: size.height * .1,
            right: size.width * .03,
            child: FloatingActionButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProductOne(),
                  )),
              child: Icon(
                Icons.add,
                color: blanc,
              ),
            ),
          ),
          Positioned(
              bottom: size.height * .02,
              child: Container(
                height: size.height * .07,
                width: size.width,
                child: Center(
                    child: MenuBottomByDiiFournisseur(
                  choix: 1,
                )),
              ))
        ],
      ),
    );
  }
}
