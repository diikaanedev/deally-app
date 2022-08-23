import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/screen/fournisseur/add-product-one.dart';
import 'package:deally_app/screen/fournisseur/add-product-view-product.dart';
import 'package:deally_app/screen/fournisseur/home-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/pack-discount-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductSaveSuccessScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final String ville;
  final double quantity;
  final String description;
  final String conservation;
  final String stock;
  final List<Uint8List?> uploadedImage;
  final List<PackDiscountsModel> packDiscounts;

  const AddProductSaveSuccessScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.description,
      required this.conservation,
      required this.ville,
      required this.stock,
      required this.uploadedImage,
      required this.packDiscounts,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductSaveSuccessScreen> createState() =>
      _AddProductSaveSuccessScreenState();
}

class _AddProductSaveSuccessScreenState
    extends State<AddProductSaveSuccessScreen> {
  late Size size;
  bool isActif = true;
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
              height: size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Congratulations your product is online !',
                style: TextStyle(
                    fontSize: size.height * .03,
                    color: meuveFonce,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                decoration: BoxDecoration(
                    color: gris.withOpacity(.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Column(
                      children: [
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
                                                  BorderRadius.circular(10)),
                                          child: Image.memory(
                                            widget.uploadedImage.first!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                        padding: EdgeInsets.all(8.0),
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.memory(
                                                  widget.uploadedImage[1]!,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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
                                        padding: EdgeInsets.all(8.0),
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.memory(
                                                  widget.uploadedImage[2]!,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: blanc),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
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
                          ],
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Icon(
                              Icons.save,
                              size: 14,
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Text(
                              '${widget.stock} pieces',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Icon(
                              Icons.location_city,
                              size: 14,
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Text(
                              '${widget.ville}',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Container(
                          height: size.height * .07,
                          width: size.width,
                          child: Row(
                            children: [
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel:
                                          widget.packDiscounts.first)),
                              SizedBox(
                                width: size.width * .03,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel:
                                          widget.packDiscounts[1])),
                              SizedBox(
                                width: size.width * .03,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel:
                                          widget.packDiscounts[2])),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: size.width * .45,
                                child: Text('Description ')),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Container(
                          width: size.width,
                          child: Text(
                            widget.description,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .016),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        widget.conservation != ""
                            ? Row(
                                children: [
                                  Container(
                                      width: size.width * .45,
                                      child: Text('Conservation ')),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        widget.conservation != ""
                            ? Container(
                                width: size.width,
                                child: Text(
                                  widget.conservation,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .016),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: size.height * .01,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Center(
              child: GestureDetector(
                onTap: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductViewProductScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          quantity: widget.quantity,
                          description: widget.description,
                          conservation: widget.conservation,
                          ville: widget.ville,
                          stock: widget.stock,
                          uploadedImage: widget.uploadedImage,
                          packDiscounts: widget.packDiscounts,
                          marque: widget.marque),
                    )),
                child: Container(
                  height: size.height * .05,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: noir.withOpacity(.8))),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "See the product as a customer".toUpperCase(),
                        style: TextStyle(
                            fontSize: size.height * .014,
                            color: noir.withOpacity(.8)),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Center(
              child: GestureDetector(
                onTap: () async => {},
                child: Container(
                  height: size.height * .05,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: noir.withOpacity(.8))),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "edit option".toUpperCase(),
                        style: TextStyle(
                            fontSize: size.height * .014,
                            color: noir.withOpacity(.8)),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Center(
              child: GestureDetector(
                onTap: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeFournisseurScreen(),
                    )),
                child: Container(
                  height: size.height * .05,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: noir.withOpacity(.8))),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "home page".toUpperCase(),
                        style: TextStyle(
                            fontSize: size.height * .014,
                            color: noir.withOpacity(.8)),
                      ),
                      Spacer(),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Center(
              child: GestureDetector(
                onTap: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductOne(),
                    )),
                child: Container(
                  height: size.height * .05,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isActif ? meuveFonce : meuveFonce.withOpacity(.3)),
                  child: Center(
                      child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Add another product".toUpperCase(),
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
            ),
            SizedBox(
              height: size.height * .025,
            ),
          ],
        ),
      ),
    );
  }
}
