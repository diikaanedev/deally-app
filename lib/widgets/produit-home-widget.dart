import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/details-produit-screen.dart';
import 'package:deally_app/screen/fournisseur/home-page-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProduitHomeWidget extends StatefulWidget {
  final bool forDetails;
  final ProduitModel? produitModel;
  const ProduitHomeWidget({Key? key, this.forDetails = true, this.produitModel})
      : super(key: key);

  @override
  _ProduitHomeWidgetState createState() => _ProduitHomeWidgetState();
}

class _ProduitHomeWidgetState extends State<ProduitHomeWidget> {
  late PackDiscountsModel packDiscountsModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.produitModel!);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.forDetails
              ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsProduitScreen(
                                produitModel: widget.produitModel!,
                              )));
                }
              : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageScreen()));
                },
          child: Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * .1),
                    color: gris.withOpacity(.5)),
              ),
              Positioned(
                  top: constraints.maxHeight * .02,
                  left: constraints.maxWidth * .05,
                  child: Container(
                    height: constraints.maxHeight * .5,
                    width: constraints.maxWidth * .9,
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: widget.produitModel!.images == null
                          ? Image.network(
                              "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png")
                          : Image.network(
                              widget.produitModel!.images,
                              width: constraints.maxWidth * .7,
                              height: constraints.maxHeight * .5,
                            ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * .05),
                      color: blanc,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * .03,
                        right: constraints.maxWidth * .03),
                    child: Container(
                      height: constraints.maxHeight * .4,
                      width: constraints.maxWidth,
                      // color: rouge,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * .1,
                            child: Text(
                              "${widget.produitModel!.name} ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: constraints.maxWidth * .06,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: constraints.maxHeight * .02,
                          // ),
                          Container(
                            height: constraints.maxHeight * .05,
                            child: Row(
                              children: [
                                // SizedBox(width: constraints.maxWidth * .01,),
                                Icon(
                                  CupertinoIcons.placemark_fill,
                                  size: constraints.maxWidth * .07,
                                ),
                                Text(
                                  '${widget.produitModel!.location == "" ? "Lagos" : widget.produitModel!.location}',
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: constraints.maxHeight * .02,
                          // ),
                          Container(
                            height: constraints.maxHeight * .05,
                            child: Row(
                              children: [
                                // SizedBox(width: constraints.maxWidth * .01,),
                                Icon(
                                  CupertinoIcons.hourglass,
                                  size: constraints.maxWidth * .07,
                                ),
                                Text(
                                  'time left',
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: constraints.maxWidth * .8,
                            height: constraints.maxHeight * .13,
                            child: Center(
                              child: widget
                                          .produitModel!.packDiscounts.length ==
                                      0
                                  ? Text(
                                      '0 NGN',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .07,
                                          fontWeight: FontWeight.w300),
                                    )
                                  : Text(
                                      '${widget.produitModel!.packDiscounts[2].price} NGN',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth * .05),
                                color: blanc),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
