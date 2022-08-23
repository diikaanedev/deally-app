import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-stock.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductConservationScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final double quantity;
  final String description;
  final List<Uint8List?> uploadedImage;
  final List<String?> imageID;

  const AddProductConservationScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.description,
      required this.uploadedImage,
      required this.imageID,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductConservationScreen> createState() =>
      _AddProductConservationScreenState();
}

class _AddProductConservationScreenState
    extends State<AddProductConservationScreen> {
  late Size size;
  bool isActif = true;
  TextEditingController conservation = TextEditingController();
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
                  'Please add product storage conditions',
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
                                        fontSize: size.height * .016),
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
                                        fontSize: size.height * .016),
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
            SizedBox(
              height: size.height * .03,
            ),
            Center(
              child: Container(
                height: size.height * .12,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: meuveFonce, width: 1)),
                child: TextFormField(
                  controller: conservation,
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 10,

                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  onChanged: (value) {
                    if (conservation.text.length > 3) {
                      setState(() {
                        isActif = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'storage condition',
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
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductStockScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          quantity: widget.quantity,
                          imageID: widget.imageID,
                          description: widget.description,
                          conservation: conservation.text,
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
                        "Validate storage conditions ",
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
              height: size.height * .02,
            )
          ],
        ),
      ),
    );
  }
}
