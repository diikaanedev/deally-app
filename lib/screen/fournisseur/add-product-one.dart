import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-name.dart';
import 'package:deally_app/screen/fournisseur/add-product-two.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/fournisseur/categorie-fournisseur-parent.dart';
import 'package:deally_app/widgets/fournisseur/categorie-fournisseur-son.dart';
import 'package:deally_app/widgets/fournisseur/categorie-fournisseur-widget.dart';
import 'package:flutter/material.dart';

class AddProductOne extends StatefulWidget {
  const AddProductOne({Key? key}) : super(key: key);

  @override
  State<AddProductOne> createState() => _AddProductOneState();
}

class _AddProductOneState extends State<AddProductOne> {
  late Size size;
  CategorieShopList selected =
      CategorieShopList(url: "url", nom: "nom", id: "id");
  List<CategorieShopList> listeCategories = [];
  List<CategorieShopList> listeCategoriesSon = [];

  @override
  void initState() {
    // TODO: implement initState
    getCategorie();
  }

  getCategorie() async {
    await getResponse(url: "/categories").then((value) => setState(() {
          listeCategories =
              CategorieShopList.fromCategorie(data: value['data']);
          selected = listeCategories[0];
        }));
    // getCategorieSon();
  }

  getCategorieSon() async {
    await getResponse(url: "/categories/son?category=" + selected.id)
        .then((value) => setState(() {
              listeCategoriesSon =
                  CategorieShopList.fromCategorie(data: value['data']);
            }));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        title: Text(
          'Add product',
          style: TextStyle(
              fontSize: size.height * .03,
              color: blanc,
              fontWeight: FontWeight.w300),
        ),
        elevation: .0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * .02,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          //   child: Text(
          //     'Select Familly ?',
          //     style: TextStyle(
          //         fontSize: size.height * .025, fontWeight: FontWeight.w300),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * .01,
          // ),
          Container(
            height: size.height * .3,
            width: size.width,
            // color: rouge,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(8.0),
              childAspectRatio: .85,
              children: listeCategories.reversed
                  .map(
                    (e) => SizedBox(
                      height: size.height * .07,
                      width: size.width * .9,
                      child: GestureDetector(
                        onTap: () {
                          print('ddd');
                          setState(() {
                            selected = e;
                          });
                          getCategorieSon();
                        },
                        child: CategorieFournisseurParentWidget(
                            categorieShopList: e, ontap: () => null),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: Text(
              'Select category ',
              style: TextStyle(
                  fontSize: size.height * .025, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            height: size.height * .5,
            width: size.width,
            // color: rouge,
            child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(8.0),
                childAspectRatio: .85,
                children: listeCategoriesSon.reversed
                    .map(
                      (e) => SizedBox(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: CategorieFournisseurSonWidget(
                            categorieShopList: e,
                            ontap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddProductNameScreen(categorie: e),
                                ))),
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
