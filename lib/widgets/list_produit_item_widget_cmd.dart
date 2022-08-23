import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProduitItemWidgetCmd extends StatefulWidget {
  final OrderItemModel orderItemModel;
  const ListProduitItemWidgetCmd({Key? key, required this.orderItemModel})
      : super(key: key);

  @override
  _ListProduitItemWidgetCmdState createState() =>
      _ListProduitItemWidgetCmdState();
}

class _ListProduitItemWidgetCmdState extends State<ListProduitItemWidgetCmd> {
  Future<ProduitModel> getProduct() async {
    return getResponse(url: "/products/${widget.orderItemModel.produitModel}")
        .then((value) {
      return ProduitModel.fromObject(value['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProduitModel>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth * .2,
                                decoration: BoxDecoration(
                                    color: blanc,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                    child:
                                        Image.network(snapshot.data!.images)),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: constraints.maxWidth * .7,
                                        child: Text(
                                          "${snapshot.data!.name} ${snapshot.data!.brand}",
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .13,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width: constraints.maxWidth * .6,
                                        child: Text(
                                          '${widget.orderItemModel.quantity} pieces',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .13,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * .2,
                                      ),
                                      Container(
                                        height: constraints.maxHeight * .18,
                                        width: constraints.maxWidth * .35,
                                        child: Center(
                                            child: Text(
                                          " ${widget.orderItemModel.price} NGN",
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .13,
                                              fontWeight: FontWeight.w300),
                                        )),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: blanc),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .2,
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      )),
                  // Expanded(
                  //     flex: 1,
                  //     child: Container(
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             width: constraints.maxWidth * .03,
                  //           ),
                  //           Container(
                  //             height: constraints.maxHeight * .1,
                  //             child: Center(
                  //               child: Text(
                  //                 'Livraison standard : ${snapshot.data!.deliveryDelay} ',
                  //                 style: TextStyle(
                  //                     fontSize: constraints.maxHeight * .07,
                  //                     fontWeight: FontWeight.w300),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             height: constraints.maxHeight * .1,
                  //             child: Column(
                  //               children: [
                  //                 Spacer(),
                  //                 Spacer(),
                  //                 Icon(
                  //                   CupertinoIcons.arrow_right,
                  //                   size: constraints.maxHeight * .06,
                  //                 ),
                  //                 Spacer(),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            // Expanded(
                            //     child: Row(
                            //   children: [
                            //     SizedBox(
                            //       width: constraints.maxWidth * .03,
                            //     ),
                            //     Text(
                            //       'Total product',
                            //       style: TextStyle(
                            //           fontSize: constraints.maxHeight * .06,
                            //           fontWeight: FontWeight.w300),
                            //     ),
                            //     Spacer(),
                            //     Text(
                            //       '${widget.orderItemModel.price} NGN',
                            //       style: TextStyle(
                            //           fontSize: constraints.maxHeight * .06,
                            //           fontWeight: FontWeight.w300),
                            //     ),
                            //     SizedBox(
                            //       width: constraints.maxWidth * .03,
                            //     ),
                            //   ],
                            // )),
                            // Expanded(
                            //     child: Row(
                            //   children: [
                            //     SizedBox(
                            //       width: constraints.maxWidth * .03,
                            //     ),
                            //     Text(
                            //       'Service Fee',
                            //       style: TextStyle(
                            //           fontSize: constraints.maxHeight * .06,
                            //           fontWeight: FontWeight.w300),
                            //     ),
                            //     Spacer(),
                            //     Text(
                            //       '${widget.orderItemModel.price * 0.22} NGN',
                            //       style: TextStyle(
                            //           fontSize: constraints.maxHeight * .06,
                            //           fontWeight: FontWeight.w300),
                            //     ),
                            //     SizedBox(
                            //       width: constraints.maxWidth * .03,
                            //     ),
                            //   ],
                            // )),
                            Expanded(
                                child: Row(
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * .25,
                                ),
                                Text(
                                  'Transprort (free) ',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .12,
                                      fontWeight: FontWeight.w300),
                                ),
                                Spacer(),
                                Text(
                                  '0 NGN',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .05,
                                ),
                              ],
                            )),
                            SizedBox(
                              height: constraints.maxHeight * .1,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
