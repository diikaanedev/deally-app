import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-picture.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductQuantityScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  const AddProductQuantityScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductQuantityScreen> createState() =>
      _AddProductQuantityScreenState();
}

class _AddProductQuantityScreenState extends State<AddProductQuantityScreen> {
  late Size size;
  String quantite = "0";
  String unity = "Select a volume unity";
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
                  'Please fill in the volume per item',
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
              height: size.height * .05,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: size.width * .05),
                    Container(
                        width: size.width * .9,
                        height: size.height * .05,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: 'Volume per item'),
                          onChanged: (v) => setState(() {
                            quantite = v;
                            isActif = true;
                          }),
                        )),
                  ],
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Container(
                  width: size.width * .9,
                  height: size.height * .05,
                  child: Center(
                    child: DropdownButton<String>(
                      value: unity,
                      elevation: 5,
                      underline: Container(
                        height: 2,
                        color: meuveFonce,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          unity = newValue!;
                        });
                      },
                      items: <String>[
                        'Select a volume unity',
                        'g',
                        'ml',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // color: rouge,
                )
              ],
            ),
            SizedBox(
              height: size.height * .15,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductPictureScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          quantity: quantite == "other"
                              ? 10.5
                              : double.parse(quantite),
                          marque: widget.marque),
                    )),
                child: Container(
                  height: size.height * .07,
                  width: size.width * .6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isActif ? meuveFonce : meuveFonce.withOpacity(.3)),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: size.width * .05,
                      ),
                      Text(
                        "Validate the quantity of the item",
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
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
