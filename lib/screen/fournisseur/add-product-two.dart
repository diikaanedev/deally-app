import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-name.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/fournisseur/categorie-fournisseur-parent.dart';
import 'package:deally_app/widgets/fournisseur/categorie-fournisseur-widget.dart';
import 'package:flutter/material.dart';

class AddProductTwo extends StatefulWidget {
  final CategorieShopList categorie;
  const AddProductTwo({Key? key, required this.categorie}) : super(key: key);

  @override
  State<AddProductTwo> createState() => _AddProductTwoState();
}

class _AddProductTwoState extends State<AddProductTwo> {
  late Size size;

  List<CategorieShopList> listeCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    getCategorie();
  }

  getCategorie() async {
    await getResponse(url: "/categories/son?category=" + widget.categorie.id)
        .then((value) => setState(() {
              listeCategories =
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: Text(
              'Add product type of product do you want to add to your warehouse ?',
              style: TextStyle(
                  fontSize: size.height * .025, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            height: size.height * .8,
            width: size.width,
            child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(8.0),
                childAspectRatio: .85,
                children: listeCategories.reversed
                    .map(
                      (e) => SizedBox(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: CategorieFournisseurParentWidget(
                            categorieShopList: e,
                            ontap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddProductTwo(categorie: e),
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
