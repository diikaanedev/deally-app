import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/categorie-screen-one.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/categorie-widget-list.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  late Size size;

  List<CategorieShopList> listeCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    // getCategorie();
  }

  Future<List<CategorieShopList>> getCategorie() async {
    return getResponse(url: "/categories")
        .then((value) => CategorieShopList.fromCategorie(data: value['data']));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: blanc,
      body: Stack(children: [
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
                    width: size.width * .1,
                  ),
                  Text(
                    'Our suggestions for you',
                    style: TextStyle(
                        fontSize: size.height * .02,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Container(
                height: size.height * .2,
                width: size.width,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: FutureBuilder<List<CategorieShopList>>(
                        future: getCategorie(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.count(
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              crossAxisCount: 2,
                              children: snapshot.data!.reversed
                                  .map(
                                    (e) => SizedBox(
                                      child: CategorieWidgetList(
                                        onPress: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CategorieScreenOne(
                                                categorie: e,
                                              ),
                                            )),
                                        categorie: e,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Container();
                          }
                        })),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              // Container(
              //   height: size.height * .2,
              //   width: size.width,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           width: size.width * .05,
              //         ),
              //         Expanded(
              //             child: Container(
              //           child: CategorieWidgetList(
              //             onPress: () => null,
              //             titre: "Huile",
              //             url: "assets/images/huile-categorie.jpeg",
              //           ),
              //         )),
              //         SizedBox(
              //           width: size.width * .05,
              //         ),
              //         Expanded(
              //             child: Container(
              //           child: CategorieWidgetList(
              //             onPress: () => null,
              //             titre: "Riz",
              //             url: "assets/images/riz.png",
              //           ),
              //         )),
              //         SizedBox(
              //           width: size.width * .05,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
                choix: 1,
              )),
            ))
      ]),
    );
  }
}
