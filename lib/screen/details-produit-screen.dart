import 'package:carousel_pro/carousel_pro.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/details-produit-screen-two.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/pack-discount-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsProduitScreen extends StatefulWidget {
  final ProduitModel produitModel;
  const DetailsProduitScreen({Key? key, required this.produitModel})
      : super(key: key);

  @override
  _DetailsProduitScreenState createState() => _DetailsProduitScreenState();
}

class _DetailsProduitScreenState extends State<DetailsProduitScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: 'search shopping ',
            onPressed: () {
              // handle the press
            },
          ),
        ],
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
                // SizedBox(
                //   height: size.height * .01,
                // ),
                // Container(
                //   height: size.height * .05,
                //   width: size.width,
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: size.width * .05,
                //       ),
                //       Container(
                //         height: size.height * .05,
                //         child: Column(
                //           children: [
                //             Spacer(),
                //             Text(
                //               '${widget.produitModel.brand}',
                //               style: TextStyle(fontWeight: FontWeight.w300),
                //             ),
                //             Spacer(),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: size.width * .01,
                //       ),
                //       Container(
                //         height: size.height * .05,
                //         child: Column(
                //           children: [
                //             SizedBox(
                //               height: size.height * .02,
                //             ),
                //             Icon(
                //               Icons.arrow_forward_rounded,
                //               size: size.width * .03,
                //             ),
                //             Spacer(),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: size.width * .01,
                //       ),
                //       Container(
                //         height: size.height * .05,
                //         child: Column(
                //           children: [
                //             Spacer(),
                //             Text(
                //               '${widget.produitModel.name} ${widget.produitModel.brand}',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: size.height * .02),
                //             ),
                //             Spacer(),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: size.height * .01,
                ),
                Center(
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .1),
                        color: blanc),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                          height: size.height * .3,
                          width: size.width,
                          child: Carousel(
                            boxFit: BoxFit.cover,
                            autoplay: false,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration: Duration(milliseconds: 1000),
                            dotSize: 6.0,
                            dotIncreasedColor: meuveFonce,
                            dotColor: meuveFonce.withOpacity(.7),
                            dotBgColor: Colors.transparent,
                            dotPosition: DotPosition.bottomCenter,
                            dotVerticalPadding: 10.0,
                            showIndicator: true,
                            indicatorBgPadding: 7.0,
                            images: widget.produitModel.listImage
                                .map((e) => Image.network(e['url']))
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                                '${widget.produitModel.name} ${widget.produitModel.brand}'),
                            Spacer(),
                          ],
                        ),
                        // SizedBox(
                        //   height: size.height * .02,
                        // ),
                        // Center(
                        //   child: Container(
                        //     child: Column(
                        //       children: [
                        //         SizedBox(
                        //           height: size.height * .005,
                        //         ),
                        //         Row(
                        //           children: [
                        //             SizedBox(
                        //               width: size.width * .0,
                        //             ),
                        //             Text(
                        //               '     unit price ${widget.produitModel.packDiscounts.first.min} minimum pieces    ',
                        //               style: TextStyle(
                        //                   color: noir,
                        //                   fontSize: size.height * .017,
                        //                   fontWeight: FontWeight.w200),
                        //             ),
                        //           ],
                        //         ),
                        //         SizedBox(
                        //           height: size.height * .005,
                        //         ),
                        //       ],
                        //     ),
                        //     decoration: BoxDecoration(
                        //       // color: noir.withOpacity(.2),
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width,
                          child: Row(
                            children: [
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel: widget
                                          .produitModel.packDiscounts.first)),
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel: widget
                                          .produitModel.packDiscounts[1])),
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Expanded(
                                  child: PackDiscountWidget(
                                      packDiscountsModel: widget
                                          .produitModel.packDiscounts[2])),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: size.height * .02,
                        // ),
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
                              'Stock : ${widget.produitModel.stock} products',
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
                              'City : ${widget.produitModel.location == '' ? 'Lagos' : widget.produitModel.location}',
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
                              'Delivery delay :${widget.produitModel.deliveryDelay == '' ? '24' : widget.produitModel.deliveryDelay} hours ',
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
                                width: size.width * .9,
                                child: Text(
                                  widget.produitModel.description,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Text(
                                    'Brand',
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Container(
                                      width: size.width * .7,
                                      child: Text(
                                        '${widget.produitModel.brand}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ))
                                ],
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Text(
                                    'Conservation advices',
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Container(
                                      width: size.width * .7,
                                      child: Text(
                                        widget.produitModel.storageCondition,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
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
          Positioned(
              bottom: size.height * .02,
              left: size.width * .05,
              child: Container(
                height: size.height * .065,
                width: size.width * .9,
                child: BtnByDiiConnexion(
                    titre: "Order",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduitScreenTwo(
                                    produitModel: widget.produitModel,
                                  )));
                    },
                    bgNormal: 1),
              ))
        ],
      ),
    );
  }
}
