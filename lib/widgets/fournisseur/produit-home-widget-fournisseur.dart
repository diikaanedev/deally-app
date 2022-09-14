import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProduitHomeWidgetFournisseur extends StatefulWidget {
  final bool forDetails;

  final ProduitModel? produitModel;
  final Function? ontap;
  const ProduitHomeWidgetFournisseur(
      {Key? key, this.forDetails = true, this.produitModel, this.ontap = null})
      : super(key: key);

  @override
  _ProduitHomeWidgetFournisseurState createState() =>
      _ProduitHomeWidgetFournisseurState();
}

class _ProduitHomeWidgetFournisseurState
    extends State<ProduitHomeWidgetFournisseur> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: widget.ontap == null ? () => {} : () => widget.ontap!(),
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
                    height: constraints.maxHeight * .45,
                    width: constraints.maxWidth * .9,
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: Image.network(
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
                      height: constraints.maxHeight * .5,
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .05,
                          ),
                          Container(
                            width: constraints.maxWidth,
                            child: Text(
                              "${widget.produitModel!.name}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: constraints.maxWidth * .07,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Row(
                            children: [
                              // SizedBox(width: constraints.maxWidth * .01,),
                              Icon(
                                CupertinoIcons.placemark_fill,
                                size: constraints.maxWidth * .07,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Text(
                                'Warehouse ',
                                style: TextStyle(fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Row(
                            children: [
                              // SizedBox(width: constraints.maxWidth * .01,),
                              Icon(
                                CupertinoIcons.hourglass,
                                size: constraints.maxWidth * .07,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Text(
                                ' days left',
                                style: TextStyle(fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          ),
                          Row(
                            children: [
                              // SizedBox(width: constraints.maxWidth * .01,),
                              Icon(
                                CupertinoIcons.money_dollar,
                                size: constraints.maxWidth * .07,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Text(
                                '2 pieces sold',
                                style: TextStyle(fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: constraints.maxWidth * .8,
                            height: constraints.maxHeight * .13,
                            child: Center(
                              child: Text(
                                'Renew',
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
