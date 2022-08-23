import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/filter_widget.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii.dart';
import 'package:deally_app/widgets/produit-home-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorieScreenOne extends StatefulWidget {
  final CategorieShopList categorie;
  const CategorieScreenOne({Key? key, required this.categorie})
      : super(key: key);

  @override
  State<CategorieScreenOne> createState() => _CategorieScreenOneState();
}

class _CategorieScreenOneState extends State<CategorieScreenOne> {
  late Size size;
  List<ProduitModel> listeProduct = [];
  @override
  void initState() {
    super.initState();
    // getProduct();
  }

  Future<List<ProduitModel>> getProduct() async {
    return getResponse(url: '/products//familly?cat=' + widget.categorie.id)
        .then((value) => ProduitModel.fromJson(data: value['data']));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: blanc,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  children: [
                    Container(
                      height: size.height * .23,
                      width: size.width,
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.categorie.url),
                                      fit: BoxFit.cover))),
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .02,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context, true),
                                    child: Icon(
                                      CupertinoIcons.chevron_back,
                                      color: blanc,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.search,
                                    color: blanc,
                                  ),
                                  SizedBox(
                                    width: size.width * .02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * .05,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    widget.categorie.nom,
                                    style: TextStyle(
                                        color: blanc,
                                        fontSize: size.height * .04,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      height: size.height * .06,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .3,
                            height: size.height * .06,
                            child: FilterWidget(
                              isFilter: true,
                              text: 'Filters',
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .3,
                            height: size.height * .06,
                            child: FilterWidget(
                              isFilter: false,
                              text: 'Ascending price ',
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Container(
                            width: size.width * .4,
                            height: size.height * .06,
                            child: FilterWidget(
                              isFilter: false,
                              text: 'Decreasing price',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Center(
                        child: FutureBuilder<List<ProduitModel>>(
                            future: getProduct(),
                            builder: (context, snatshop) {
                              if (snatshop.hasData) {
                                return SizedBox(
                                  height: size.height * .6,
                                  width: size.width * .95,
                                  child: GridView.count(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: .7,
                                    crossAxisCount: 2,
                                    children: snatshop.data!
                                        .map(
                                          (e) => Container(
                                            width: size.width * .45,
                                            child: Center(
                                                child: ProduitHomeWidget(
                                              produitModel: e,
                                            )),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: size.height * .6,
                                  width: size.width * .95,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            })),
                    SizedBox(
                      height: size.height * .2,
                    )
                  ],
                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
