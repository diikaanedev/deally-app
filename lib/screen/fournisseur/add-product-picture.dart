import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-description.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/upload-file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPictureScreen extends StatefulWidget {
  final CategorieShopList categorie;
  final String nom;
  final String marque;
  final double quantity;
  const AddProductPictureScreen(
      {Key? key,
      required this.categorie,
      required this.nom,
      required this.quantity,
      required this.marque})
      : super(key: key);

  @override
  State<AddProductPictureScreen> createState() =>
      _AddProductPictureScreenState();
}

class _AddProductPictureScreenState extends State<AddProductPictureScreen> {
  Uint8List? uploadedImage1;
  Uint8List? uploadedImage2;
  Uint8List? uploadedImage3;

  String? imageID1;
  String? imageID2;
  String? imageID3;

  int source = 1;

  late Size size;
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
            Center(
              child: Container(
                height: size.height * .06,
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
              height: size.height * .02,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  '   Please add product photos',
                  style: TextStyle(fontWeight: FontWeight.w300, color: noir),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Center(
              child: Container(
                height: size.height * .06,
                width: size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: gris.withOpacity(.3),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Spacer(),
                        GestureDetector(
                          onTap: () => setState(() {
                            source = 1;
                          }),
                          child: Container(
                            width: size.width * .3,
                            child: Center(
                              child: Text(
                                'Gallery',
                                style: TextStyle(color: blanc),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: source == 1
                                    ? meuveFonce
                                    : meuveFonce.withOpacity(.5),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        GestureDetector(
                          onTap: () => setState(() {
                            source = 2;
                          }),
                          child: Container(
                            width: size.width * .3,
                            child: Center(
                              child: Text(
                                'Camera',
                                style: TextStyle(color: blanc),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: source == 2
                                    ? meuveFonce
                                    : meuveFonce.withOpacity(.5),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        // Spacer(),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Center(
              child: SizedBox(
                height: size.height * .17,
                width: size.width * .9,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () => getImage(source).then((value) {
                        print(value);
                        setState(() {
                          uploadedImage1 = value[1];
                          imageID1 = value[0];
                          isActif = true;
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: uploadedImage1 == null
                            ? Container(
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.photo_camera,
                                    size: size.height * .05,
                                    color: meuveFonce,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: gris.withOpacity(.6)),
                              )
                            : Image.memory(uploadedImage1!, fit: BoxFit.cover),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => getImage(source).then((value) {
                        setState(() {
                          isActif = true;
                          uploadedImage2 = value[1];
                          imageID2 = value[0];
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: uploadedImage2 == null
                            ? Container(
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.photo_camera,
                                    size: size.height * .05,
                                    color: meuveFonce,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: gris.withOpacity(.6)),
                              )
                            : Image.memory(uploadedImage2!, fit: BoxFit.cover),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => getImage(source).then((value) {
                        setState(() {
                          isActif = true;
                          uploadedImage3 = value[1];
                          imageID3 = value[0];
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: uploadedImage3 == null
                            ? Container(
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.photo_camera,
                                    size: size.height * .05,
                                    color: meuveFonce,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: gris.withOpacity(.6)),
                              )
                            : Image.memory(uploadedImage3!, fit: BoxFit.cover),
                      ),
                    )),
                  ],
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
                      builder: (context) => AddProductDescriptionScreen(
                          categorie: widget.categorie,
                          nom: widget.nom,
                          quantity: widget.quantity,
                          imageID: [imageID1, imageID2, imageID3],
                          uploadedImage: [
                            uploadedImage1,
                            uploadedImage2,
                            uploadedImage3
                          ],
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
                        "Validate product photos",
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
