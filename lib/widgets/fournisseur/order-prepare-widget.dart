import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/models/order-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:deally_app/screen/fournisseur/order-prepare.dart';

class OrderToPrepareObject extends StatefulWidget {
  final OrderModel orderModel;
  const OrderToPrepareObject({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<OrderToPrepareObject> createState() => _OrderToPrepareObjectState();
}

class _OrderToPrepareObjectState extends State<OrderToPrepareObject> {
  Future<ProduitModel> getProduit() async {
    return getResponse(url: '/products/' + widget.orderModel.product)
        .then((value) => ProduitModel.fromObject(value['data']));
  }

  Future<AdresseModel> getAdresse(String id) async {
    late AdresseModel place;
    await getResponse(url: '/address/me').then((value) {
      List<AdresseModel> listes = AdresseModel.fromJson(data: value['data']);

      for (var element in listes) {
        print(element.id);
      }

      // ignore: void_checks
      place = listes.firstWhere((element) => element.id == id);
    });
    return place;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: blanc,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2, color: gris, offset: const Offset(2, 2))
              ]),
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: FutureBuilder<ProduitModel>(
              future: getProduit(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                      Expanded(
                          child: Center(
                              child: Image.network(
                        snapshot.data!.images,
                      ))),
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                      Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(height: constraints.maxHeight * .05),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      Text(
                                        snapshot.data!.name.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight * .07,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: constraints.maxHeight * .02),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      Text(
                                        "ref order : " +
                                            widget.orderModel.reference
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight * .07,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: constraints.maxHeight * .02),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      Text(
                                        "Quantity  : " +
                                            widget.orderModel.quantite
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight * .07,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: constraints.maxHeight * .02),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      Text(
                                        "Price  : " +
                                            widget.orderModel.priceTotal
                                                .toString() +
                                            "  NGN",
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight * .07,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: constraints.maxHeight * .02),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      FutureBuilder<AdresseModel>(
                                          future: getAdresse(
                                              snapshot.data!.location),
                                          builder: (context, snap) {
                                            print(
                                                "snapshot.data!.location  =< ${snapshot.data!.location}");
                                            if (snap.hasData) {
                                              return Text(
                                                "Warehouse  : ${snap.data!.city},${snap.data!.addr1}",
                                                style: TextStyle(
                                                  fontSize:
                                                      constraints.maxHeight *
                                                          .07,
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                child: SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                    child:
                                                        CircularProgressIndicator()),
                                              );
                                            }
                                          }),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(height: constraints.maxHeight * .08),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * .02,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await putResponse(
                                              url: '/order-items/' +
                                                  widget.orderModel.id,
                                              body: {
                                                "statusShop": widget.orderModel
                                                            .statusShop ==
                                                        "CREATE"
                                                    ? "CANCELED"
                                                    : widget.orderModel
                                                                .statusShop ==
                                                            "FINISHED"
                                                        ? "CREATE"
                                                        : "DELIVERY"
                                              }).then((value) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const OrderPrepare()));
                                          });
                                        },
                                        child: Container(
                                          height: constraints.maxHeight * .23,
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          width: constraints.maxWidth * .27,
                                          child: Center(
                                            child: Text(
                                              widget.orderModel.statusShop ==
                                                      "CREATE"
                                                  ? 'Refuse'
                                                  : widget.orderModel
                                                              .statusShop ==
                                                          "CANCELED"
                                                      ? 'Delete'
                                                      : 'Not ready',
                                              style: TextStyle(color: noir),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * .05,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await putResponse(
                                              url: '/order-items/' +
                                                  widget.orderModel.id,
                                              body: {
                                                "statusShop": widget.orderModel
                                                            .statusShop ==
                                                        "CREATE"
                                                    ? "FINISHED"
                                                    : widget.orderModel
                                                                .statusShop ==
                                                            "CANCELED"
                                                        ? "CREATE"
                                                        : "DELIVERY"
                                              }).then((value) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const OrderPrepare()));
                                          });
                                        },
                                        child: Container(
                                          height: constraints.maxHeight * .23,
                                          child: Center(
                                            child: Text(
                                              widget.orderModel.statusShop ==
                                                      "CREATE"
                                                  ? 'Accept'
                                                  : widget.orderModel
                                                              .statusShop ==
                                                          "CANCELED"
                                                      ? 'Retrieve'
                                                      : 'To pick up',
                                              style: TextStyle(
                                                color: blanc,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: meuveFonce,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          width: constraints.maxWidth * .27,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
