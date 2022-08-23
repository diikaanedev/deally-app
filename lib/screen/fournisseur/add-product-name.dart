import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-produit-brand.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductNameScreen extends StatefulWidget {
  final CategorieShopList categorie;
  const AddProductNameScreen({Key? key, required this.categorie})
      : super(key: key);

  @override
  State<AddProductNameScreen> createState() => _AddProductNameScreenState();
}

class _AddProductNameScreenState extends State<AddProductNameScreen> {
  late Size size;
  TextEditingController nom = TextEditingController();
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
                  'Please fill in the product name',
                  style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Center(
              child: Container(
                height: size.height * .07,
                width: size.width * .8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: meuveFonce, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nom,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height * .02),
                    onChanged: (value) {
                      if (nom.text.length > 3) {
                        setState(() {
                          isActif = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                      hintStyle: TextStyle(
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
                height: size.height * .07,
                width: size.width * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActif ? meuveFonce : meuveFonce.withOpacity(.3)),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProductBrandScreen(
                            categorie: widget.categorie, nom: nom.text),
                      )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * .05,
                      ),
                      Text(
                        'Validate product name',
                        style: TextStyle(
                            fontSize: size.height * .014, color: blanc),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.arrow_right,
                        color: blanc,
                        size: 14,
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
