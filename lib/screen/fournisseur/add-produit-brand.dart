import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-quantity.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductBrandScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  const AddProductBrandScreen(
      {Key? key, required this.categorie, required this.nom})
      : super(key: key);

  @override
  State<AddProductBrandScreen> createState() => _AddProductBrandScreenState();
}

class _AddProductBrandScreenState extends State<AddProductBrandScreen> {
  late Size size;
  TextEditingController marque = TextEditingController();
  bool isActif = false;
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
      body: SizedBox(
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
                  'Validate product name',
                  style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Center(
              child: Container(
                height: size.height * .08,
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: gris.withOpacity(.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: widget.nom,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Center(
              child: Container(
                height: size.height * .08,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: meuveFonce, width: 1)),
                child: TextFormField(
                  controller: marque,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  onChanged: (value) {
                    if (marque.text.length > 3) {
                      setState(() {
                        isActif = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Product brand',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height * .02),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Center(
              child: Container(
                height: size.height * .07,
                width: size.width * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActif ? meuveFonce : meuveFonce.withOpacity(.3)),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProductQuantityScreen(
                            categorie: widget.categorie,
                            nom: widget.nom,
                            marque: marque.text),
                      )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * .05,
                      ),
                      Text(
                        'Validate product brand',
                        style: TextStyle(
                            fontSize: size.height * .014, color: blanc),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.arrow_right,
                        size: 14,
                        color: blanc,
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
