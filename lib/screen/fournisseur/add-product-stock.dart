import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-entrepot.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductStockScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final double quantity;
  final String description;
  final String conservation;
  final List<String?> imageID;
  final List<Uint8List?> uploadedImage;

  const AddProductStockScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.description,
      required this.conservation,
      required this.uploadedImage,
      required this.imageID,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductStockScreen> createState() => _AddProductStockScreenState();
}

class _AddProductStockScreenState extends State<AddProductStockScreen> {
  late Size size;
  String stock = "0";
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
                  'Please add the stock quantities of your product',
                  style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    // height: size.height * .15,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: blanc,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                // height: size.height * .15,
                                width: size.width * .9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: gris.withOpacity(.3),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: size.width * .02,
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(0.0),
                                              child: Container(
                                                width: size.width * .25,
                                                height: size.height * .13,
                                                child: Column(
                                                  children: [
                                                    Spacer(),
                                                    Container(
                                                      width: size.width * .23,
                                                      height: size.height * .1,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Image.memory(
                                                        widget.uploadedImage
                                                            .first!,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Spacer()
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: blanc),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        widget.uploadedImage[1] != null
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Container(
                                                      width: size.width * .25,
                                                      height: size.height * .13,
                                                      child: Column(
                                                        children: [
                                                          Spacer(),
                                                          Container(
                                                            width: size.width *
                                                                .23,
                                                            height:
                                                                size.height *
                                                                    .1,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Image.memory(
                                                              widget.uploadedImage[
                                                                  1]!,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          Spacer()
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: blanc),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                        Spacer(),
                                        widget.uploadedImage[2] != null
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Container(
                                                      width: size.width * .25,
                                                      height: size.height * .13,
                                                      child: Column(
                                                        children: [
                                                          Spacer(),
                                                          Container(
                                                            width: size.width *
                                                                .23,
                                                            height:
                                                                size.height *
                                                                    .1,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Image.memory(
                                                              widget.uploadedImage[
                                                                  2]!,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          Spacer()
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: blanc),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                        Spacer(),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // width: size.width * .45,
                                        child: Column(
                                          children: [
                                            Container(
                                              // width: size.width * .45,
                                              child: Text(
                                                widget.nom +
                                                    " " +
                                                    widget.marque +
                                                    " --" +
                                                    widget.quantity.toString() +
                                                    "L",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        size.height * .016),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * .01,
                                            ),
                                            Container(
                                                // width: size.width * .45,
                                                child: Text('Description ')),
                                            SizedBox(
                                              height: size.height * .01,
                                            ),
                                            Container(
                                              // width: size.width * .5,
                                              child: Text(
                                                widget.description,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        size.height * .016),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * .01,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Center(
              child: Container(
                height: size.height * .35,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: meuveFonce)),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                'Quantity available',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width: size.width * .1,
                              ),
                              Container(
                                  width: size.width * .2,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (v) => setState(() {
                                      stock = v;
                                      isActif = true;
                                    }),
                                  ))
                            ],
                          ),
                        )),
                    Container(
                      height: 1,
                      color: meuveFonce,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                        flex: 9,
                        child: Column(
                          children: [
                            "5",
                            "10",
                            "15",
                            '20',
                            "25",
                            "30",
                          ]
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => setState(() {
                                            stock = e;
                                            isActif = true;
                                          }),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: stock == e
                                                      ? meuveFonce
                                                      : noir),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductEntrepotScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          quantity: widget.quantity,
                          description: widget.description,
                          conservation: widget.conservation,
                          imageID: widget.imageID,
                          stock: stock,
                          uploadedImage: widget.uploadedImage,
                          marque: widget.marque),
                    )),
                child: Container(
                  height: size.height * .07,
                  width: size.width * .7,
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
                        "Validate quantity per stock ",
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
