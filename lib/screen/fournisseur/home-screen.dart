import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-one.dart';
import 'package:deally_app/screen/fournisseur/edit-product.dart';
import 'package:deally_app/utils/close-app.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/fournisseur/produit-home-widget-fournisseur.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii-fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeFournisseurScreen extends StatefulWidget {
  const HomeFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<HomeFournisseurScreen> createState() => _HomeFournisseurScreenState();
}

class _HomeFournisseurScreenState extends State<HomeFournisseurScreen> {
  late Size size;
  List<ProduitModel> listeProduct = [];
  List<Widget> liste = [];
  String nameCompagny = "";
  @override
  void initState() {
    super.initState();
    getInfo();
    getProduct();
  }

  getInfo() async {
    await getResponse(url: "/users").then((value) => {
          setState(() {
            nameCompagny = value['data']['user']['nameShop'];
          })
        });
  }

  getProduct() async {
    await SharedPreferences.getInstance().then((prefs) async {
      print(prefs.getString("compagnyName"));
      if (prefs.containsKey("compagnyName")) {
        setState(() {
          // nameCompagny = prefs.getString("compagnyName")! + " Supermaket";
        });
      }

      await getResponse(url: '/products/shop').then((value) {
        setState(() {
          listeProduct = ProduitModel.fromJson(data: value['data']);
          print(listeProduct.first.brand);
          liste = listeProduct
              .map(
                (e) => Container(
                  width: size.width * .45,
                  child: Center(
                      child: ProduitHomeWidgetFournisseur(
                    produitModel: e,
                    ontap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProdcut(
                            produit: e,
                          ),
                        )),
                  )),
                ),
              )
              .toList();

          liste.add(Container(
            width: size.width * .45,
            height: size.height * .1,
          ));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
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
                    child: Column(
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              nameCompagny,
                              style: TextStyle(
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w400,
                                  color: blanc),
                            ),
                          ],
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
                      height: size.height * .05,
                      width: size.width,
                      // color: gris.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          children: [
                            Container(
                                width: size.width * .95,
                                child: Text(
                                  'Your products online ',
                                  style: TextStyle(
                                      fontSize: size.height * .02,
                                      fontWeight: FontWeight.w300),
                                )),
                            // Container(
                            //     width: size.width * .95,
                            //     child: Text(
                            //       'votre entrepot ${widget.stock} piecessupermarket',
                            //       style: TextStyle(
                            //           fontSize: size.height * .03,
                            //           fontWeight: FontWeight.w300),
                            //     )),
                          ],
                        ),
                      )),
                  // SizedBox(
                  //   height: size.height * .02,
                  // ),
                  Center(
                    child: Container(
                      height: size.height * .7,
                      width: size.width * .95,
                      // color: rouge,
                      child: GridView.count(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: .7,
                        crossAxisCount: 2,
                        children: liste,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .2,
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
                    choix: 0,
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
