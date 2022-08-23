import 'dart:ui';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/categorie-widget.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii.dart';
import 'package:deally_app/widgets/produit-home-widget.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Size size;
  List<Container> listeWidget = [];
  List<ProduitModel> listeProduct = [];
  String nameShop = "";
  List<CategorieShopList> listeCategories = [];
  String url = "";

  bool noCat = true;

  @override
  void initState() {
    super.initState();
    getInfo();
    getCategorie();
    getProduct();
  }

  getInfo() async {
    await getResponse(url: "/users").then((value) => setState(() {
          print(value);
          nameShop = value['data']['user']['firstName'];
        }));
  }

  getCategorie() async {
    await getResponse(url: "/categories?parent=true")
        .then((value) => setState(() {
              listeCategories =
                  CategorieShopList.fromCategorie(data: value['data']);
            }));
  }

  getProduct() async {
    await getResponse(url: '/products').then((value) {
      print(value['data']);
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        if (listeProduct.length == 0) {
          setState(() {
            noCat = false;
          });
        }
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: ProduitHomeWidget(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        listeWidget.add(Container(
          width: size.width * .45,
        ));
        listeWidget.add(Container(
          width: size.width * .45,
        ));
      });
    });
  }

  getProductByCategorie(String url) async {
    print('getProductByCategorie');
    await getResponse(url: '/products/categorie?cat=' + url).then((value) {
      print(value['data']);
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: ProduitHomeWidget(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        listeWidget.add(Container(
          width: size.width * .45,
        ));
        listeWidget.add(Container(
          width: size.width * .45,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        toolbarHeight: .0,
      ),
      backgroundColor: blanc,
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
                Container(
                  height: size.height * .07,
                  width: size.width,
                  // ignore: sort_child_properties_last
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Choose category",
                              style: TextStyle(
                                  fontSize: size.width * .05,
                                  color: blanc,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage("assets/images/bg-sododin.png"),
                      //     fit: BoxFit.cover),
                      // gradient: LinearGradient(
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight,
                      //     tileMode: TileMode.mirror,
                      //     colors: [
                      //       blanc,
                      //       blanc,
                      //       blanc,
                      //       gris.withOpacity(.04),
                      //     ]),
                      color: meuveFonce),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .2,
                  width: size.width,
                  // color: rouge.withOpacity(.2),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: listeCategories
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // color: rouge,
                              width: size.width * .3,
                              child: CategorieWidget(
                                categorieShopList: e,
                                isActif: false,
                                ontap: () async {
                                  var d = url.split('|');

                                  if (d.contains(e.id)) {
                                    print("here we are ");
                                    setState(() {
                                      d.removeWhere(
                                          (element) => element == e.id);

                                      url = d.join('|');
                                    });
                                  } else {
                                    print("here we are  not ere");
                                    setState(() {
                                      url += e.id + '|';
                                    });
                                  }

                                  print(d);
                                  print(url);
                                  if (url.length > 0) {
                                    await getProductByCategorie(url);
                                    if (listeProduct.length == 0) {
                                      setState(() {
                                        noCat = false;
                                      });
                                    } else {
                                      setState(() {
                                        noCat = true;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      noCat = true;
                                    });
                                    getProduct();
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
                      noCat
                          ? 'Best offer on this category'
                          : 'No product is available on this category for now',
                      style: TextStyle(
                          fontSize: size.width * .04,
                          color: meuveFonce,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Center(
                  child: SizedBox(
                    height: size.height * .6,
                    width: size.width * .95,
                    child: GridView.count(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: .7,
                      crossAxisCount: 2,
                      children: listeWidget,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'See all products',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.width * .05),
                    ),
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: meuveFonce,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: size.height * .2,
                )
              ],
            ),
          )),
          Positioned(
              bottom: size.height * .02,
              child: Container(
                height: size.height * .07,
                width: size.width,
                child: Center(
                    child: MenuBottomByDii(
                  choix: 0,
                )),
              ))
        ],
      ),
    );
  }
}
