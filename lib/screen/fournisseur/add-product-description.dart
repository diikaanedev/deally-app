import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-conservation.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductDescriptionScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final double quantity;
  final List<Uint8List?> uploadedImage;
  final List<String?> imageID;
  const AddProductDescriptionScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.uploadedImage,
      required this.imageID,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductDescriptionScreen> createState() =>
      _AddProductDescriptionScreenState();
}

class _AddProductDescriptionScreenState
    extends State<AddProductDescriptionScreen> {
  late Size size;
  bool isActif = false;
  TextEditingController description = TextEditingController();
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
                  'Please add a product description',
                  style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                height: size.height * .15,
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: gris.withOpacity(.3),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width * .3,
                        height: size.height * .13,
                        child: Center(
                          child: Container(
                            width: size.width * .23,
                            height: size.height * .1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.memory(
                              widget.uploadedImage.first!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: blanc),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.nom +
                            " " +
                            widget.marque +
                            " --" +
                            widget.quantity.toString() +
                            "L",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .016),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Center(
              child: Container(
                height: size.height * .35,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: meuveFonce, width: 1)),
                child: TextFormField(
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 10,

                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  onChanged: (value) {
                    if (description.text.length > 3) {
                      setState(() {
                        isActif = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Product Description',
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
              height: size.height * .2,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductConservationScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          imageID: widget.imageID,
                          quantity: widget.quantity,
                          description: description.text,
                          uploadedImage: widget.uploadedImage,
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
                        "Validate the product description",
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
