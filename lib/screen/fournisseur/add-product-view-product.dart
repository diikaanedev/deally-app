import 'dart:typed_data';

import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/pack-discount-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductViewProductScreen extends StatefulWidget {
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
  const AddProductViewProductScreen(
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
  _AddProductViewProductScreenState createState() =>
      _AddProductViewProductScreenState();
}

class _AddProductViewProductScreenState
    extends State<AddProductViewProductScreen> {
  late Size size;
  int urlSelected = 0;
  late List<Uint8List?> images;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images = widget.uploadedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
      ),
      backgroundColor: blanc,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * .03,
                ),
                Center(
                  child: Container(
                    width: size.width * .8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .1),
                        color: gris.withOpacity(.5)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: size.width * .7,
                                height: size.height * .4,
                                child: Center(
                                  child: Image.memory(
                                    images[urlSelected]!,
                                    width: size.width * .6,
                                    height: size.height * .35,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: blanc,
                                    borderRadius: BorderRadius.circular(
                                        size.width * .05)),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 5,
                                  child: Container(
                                    width: size.width * .7,
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Icon(
                                          Icons.star,
                                          color: meuveFonce,
                                          size: size.width * .04,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: meuveFonce),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        )
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  right: 5,
                                  top: size.height * .15,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons
                                            .chevron_right_circle_fill,
                                        size: size.width * .07,
                                        color: meuveFonce,
                                      ))),
                              Positioned(
                                  left: 5,
                                  bottom: 5,
                                  child: Container(
                                    width: size.width * .7,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          Icons.timelapse_sharp,
                                          color: meuveFonce,
                                          size: size.width * .04,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '18min 53',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: meuveFonce),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .07,
                            ),
                            Text('${widget.nom} -- ${widget.quantity}L')
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  '   prix à l\'unité ${widget.packDiscounts.first.min} pièces minimun   ',
                                  style: TextStyle(
                                      color: blanc,
                                      fontSize: size.height * .015,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: noir.withOpacity(.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
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
                                width: size.width * .01,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel:
                                          widget.packDiscounts[1])),
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel:
                                          widget.packDiscounts[2])),
                            ],
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
                            Icon(
                              CupertinoIcons.floppy_disk,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Stock : ${widget.stock} pieces',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
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
                            Icon(
                              CupertinoIcons.placemark_fill,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Ville : ${widget.ville}',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
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
                            Icon(
                              Icons.directions_car,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Délais de livraison : 2 à 7 jours',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
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
                              'Description',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.w300),
                            )
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
                            Container(
                                width: size.width * .7,
                                child: Text(
                                  '${widget.description}',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ))
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
                              'Marque',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.w300),
                            )
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
                            Container(
                                width: size.width * .7,
                                child: Text(
                                  '${widget.marque}',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ))
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
                              'Conseil de conservation',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.w300),
                            )
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
                            Container(
                                width: size.width * .7,
                                child: Text(
                                  '${widget.conservation}',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * .1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
