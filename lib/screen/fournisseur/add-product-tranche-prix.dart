import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/screen/fournisseur/add-save-product.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductTranchePrixScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final String ville;
  final String idAddress;
  final double quantity;
  final String description;
  final String conservation;
  final List<String?> imageID;
  final String stock;
  final List<Uint8List?> uploadedImage;
  const AddProductTranchePrixScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.description,
      required this.conservation,
      required this.ville,
      required this.idAddress,
      required this.stock,
      required this.uploadedImage,
      required this.imageID,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductTranchePrixScreen> createState() =>
      _AddProductTranchePrixScreenState();
}

class _AddProductTranchePrixScreenState
    extends State<AddProductTranchePrixScreen> {
  late Size size;
  TextEditingController quantiteMin1 = TextEditingController();
  TextEditingController quantiteMax1 = TextEditingController();
  TextEditingController price1 = TextEditingController();
  TextEditingController quantiteMin2 = TextEditingController();
  TextEditingController quantiteMax2 = TextEditingController();
  TextEditingController price2 = TextEditingController();
  TextEditingController quantiteMin3 = TextEditingController();
  TextEditingController quantiteMax3 = TextEditingController();
  TextEditingController price3 = TextEditingController();
  bool quantiteMin1Error = false;
  bool quantiteMax1Error = false;
  bool price1Error = false;
  bool quantiteMin2Error = false;
  bool quantiteMax2Error = false;
  bool price2Error = false;
  bool quantiteMin3Error = false;
  bool quantiteMax3Error = false;
  bool price3Error = false;
  bool isActif = false;
  int valid = 1;
  TextEditingController description = TextEditingController();
  List<PackDiscountsModel> packDiscount = [];
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
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Text(
                    'Please fill in slices and slice prices',
                    style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .02,
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
                                    borderRadius: BorderRadius.circular(10.0),
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
                                                    BorderRadius.circular(10)),
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
                                                    BorderRadius.circular(10)),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: size.width * .45,
                        // height: size.height * .2,
                        child: Column(
                          children: [
                            Row(
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
                                        fontSize: size.height * .016),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.save,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Text(
                                  '${widget.stock} pieces ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.building_2_fill,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Text(
                                  '${widget.ville}  ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Row(
                              children: [
                                Container(
                                    // width: size.width * .45,
                                    child: Text('Description ')),
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Container(
                              // width: size.width * .5,
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
                                ? Container(
                                    width: size.width * .45,
                                    child: Text('Conservation '))
                                : Container(),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            widget.conservation != ""
                                ? Container(
                                    width: size.width * .5,
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
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .06,
                      ),
                      Text('Minimum order')
                    ],
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMin1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMin1Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: quantiteMin1Error
                                      ? Text('value need to be change')
                                      : Text('Minimum quantity'),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: quantiteMin1Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMin1Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                          SizedBox(
                            width: size.width * .017,
                          ),
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMax1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMax1Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: quantiteMax1Error
                                      ? Text('value need to be change')
                                      : Text('Maximum quantity'),
                                  labelStyle: TextStyle(
                                      color: quantiteMax1Error ? rouge : noir,
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMax1Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: price1,
                                style: TextStyle(
                                    color: price1Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: price1Error
                                      ? Text('value need to be change')
                                      : Text("Price per quantity"),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: price1Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: price1Error ? rouge : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .017,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .06,
                      ),
                      Text('Acceptable order')
                    ],
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMin2,
                                style: TextStyle(
                                    color: quantiteMin2Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: quantiteMin2Error
                                      ? Text('value need to be change')
                                      : Text('Minimum quantity'),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: quantiteMin2Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMin2Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                          SizedBox(
                            width: size.width * .017,
                          ),
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMax2,
                                style: TextStyle(
                                    color: quantiteMax2Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                onChanged: (value) {},
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: quantiteMax2Error
                                      ? Text('value need to be change')
                                      : Text('Maximum quantity'),
                                  labelStyle: TextStyle(
                                      color: quantiteMax2Error ? rouge : noir,
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMin2Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: price2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: price2Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: price2Error
                                      ? Text('value need to be change')
                                      : Text('Price per quantity'),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: price2Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: price2Error ? rouge : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .017,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .06,
                      ),
                      Text('Best pricing')
                    ],
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMin3,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMin3Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: quantiteMin3Error
                                      ? Text('value need to be change')
                                      : Text('Maximum quantity'),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: quantiteMin3Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMin3Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                          SizedBox(
                            width: size.width * .017,
                          ),
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: quantiteMax3,
                                style: TextStyle(
                                    color: quantiteMax3Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  label: quantiteMax3Error
                                      ? Text('value need to be change')
                                      : Text('Maximum quantity'),
                                  labelStyle: TextStyle(
                                      color: quantiteMax3Error ? rouge : noir,
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: quantiteMax3Error
                                        ? rouge
                                        : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Center(
                    child: Container(
                      width: size.width * .9,
                      height: size.height * .06,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            // ignore: sort_child_properties_last
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: price3,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: price3Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    isActif = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  label: price3Error
                                      ? Text('value need to be change')
                                      : Text('Price per quantity'),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: price3Error ? rouge : noir,
                                      fontSize: size.height * .017),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: price3Error ? rouge : meuveFonce)),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    valid = 1;
                  });
                  if (int.parse(quantiteMin1.text) > 1 &&
                      int.parse(quantiteMin1.text) <
                          int.parse(quantiteMax1.text)) {
                    setState(() {
                      quantiteMin1Error = false;
                      // valid = 1;
                    });
                  } else {
                    setState(() {
                      quantiteMin1Error = true;
                      valid = 2;
                    });
                  }

                  if (int.parse(quantiteMax1.text) >
                      int.parse(quantiteMin1.text)) {
                    setState(() {
                      quantiteMax1Error = false;
                      // valid = 1;
                    });
                  } else {
                    setState(() {
                      quantiteMax1Error = true;
                      // valid = 2;
                    });
                  }

                  if (int.parse(quantiteMax2.text) >
                      int.parse(quantiteMin2.text)) {
                    setState(() {
                      quantiteMax2Error = false;
                      // valid = 1;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      quantiteMax2Error = true;
                    });
                  }

                  if (int.parse(quantiteMin2.text) >
                          int.parse(quantiteMax1.text) &&
                      int.parse(quantiteMin2.text) <
                          int.parse(quantiteMax2.text)) {
                    setState(() {
                      // valid = 1;
                      quantiteMin2Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      quantiteMin2Error = true;
                    });
                  }

                  if (int.parse(quantiteMax3.text) >
                      int.parse(quantiteMin3.text)) {
                    setState(() {
                      // valid = 1;
                      quantiteMax3Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      quantiteMax3Error = true;
                    });
                  }

                  if (int.parse(quantiteMin3.text) >
                          int.parse(quantiteMax2.text) &&
                      int.parse(quantiteMin3.text) <
                          int.parse(quantiteMax3.text)) {
                    setState(() {
                      // valid = 1;
                      quantiteMin3Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      quantiteMin3Error = true;
                    });
                  }

                  if (int.parse(price1.text) >= 50) {
                    setState(() {
                      // valid = 1;
                      price1Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      price1Error = true;
                    });
                  }

                  if (int.parse(price2.text) <= int.parse(price1.text)) {
                    setState(() {
                      // valid = 1;
                      price2Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      price2Error = true;
                    });
                  }

                  if (int.parse(price3.text) <= int.parse(price2.text)) {
                    setState(() {
                      // valid = 1;
                      price3Error = false;
                    });
                  } else {
                    setState(() {
                      valid = 2;
                      price3Error = true;
                    });
                  }
                  print(valid);
                  if (valid == 1) {
                    packDiscount.add(PackDiscountsModel(
                        id: "1",
                        min: int.parse(quantiteMin1.text),
                        max: int.parse(quantiteMax1.text),
                        price: int.parse(price1.text)));
                    packDiscount.add(PackDiscountsModel(
                        id: "2",
                        min: int.parse(quantiteMin2.text),
                        max: int.parse(quantiteMax2.text),
                        price: int.parse(price2.text)));
                    packDiscount.add(PackDiscountsModel(
                        id: "3",
                        min: int.parse(quantiteMin3.text),
                        max: int.parse(quantiteMax3.text),
                        price: int.parse(price3.text)));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProductSaveScreen(
                              categorie: widget.categorie,
                              nom: widget.nom,
                              quantity: widget.quantity,
                              description: widget.description,
                              conservation: widget.conservation,
                              ville: widget.ville,
                              idAddress: widget.idAddress,
                              packDiscounts: packDiscount,
                              stock: widget.stock,
                              uploadedImage: widget.uploadedImage,
                              imageID: widget.imageID,
                              marque: widget.marque),
                        ));
                  }
                },
                child: Container(
                  height: size.height * .06,
                  width: size.width * .9,
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
                        "Confirm the pricing".toUpperCase(),
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
              height: size.height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
