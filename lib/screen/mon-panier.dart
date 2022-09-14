import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/screen/confirmation_commande.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/get-currency.dart';
import 'package:deally_app/utils/price-format.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/list-produit-mon-pannieritem-widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

late _MonPanierState panier;

class MonPanier extends StatefulWidget {
  const MonPanier({Key? key}) : super(key: key);

  @override
  _MonPanierState createState() {
    panier = _MonPanierState();
    return panier;
  }
}

class _MonPanierState extends State<MonPanier> {
  late Size size;
  bool isAllSelect = false;
  int isSelect = 0;

  int priceTotalPannier = 0;

  List<OrderItemModel> listeOrderItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListOrderItem();
  }

  getListOrderItem() async {
    await SharedPreferences.getInstance().then((prefs) async {
      await getResponse(url: "/order-items").then((value) {
        print("value => ");
        print(value);
        setState(() {
          listeOrderItems = OrderItemModel.fromList(data: value['data']);
        });

        // if (prefs.containsKey("pannier")) {
        //   List<int> ids =
        //       prefs.getStringList("pannier")!.map((e) => int.parse(e)).toList();
        //   setState(() {
        //     listeOrderItems = listeOrderItems
        //         .where((element) => ids.contains(element.id))
        //         .toList();
        //   });
        // } else {
        //   setState(() {
        //     listeOrderItems = [];
        //   });
        // }
      });
    });

    for (var item in listeOrderItems) {
      setState(() {
        priceTotalPannier += item.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        title: Row(
          children: [
            Text(
              'My cart',
              style: TextStyle(
                fontSize: size.height * .025,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Text(
                      "All products",
                      style: TextStyle(
                          fontSize: size.width * .045,
                          fontWeight: FontWeight.w300),
                    ),
                    Spacer(),
                    isSelect == 1
                        ? GestureDetector(
                            onTap: () => setState(() {
                              isSelect = 0;
                            }),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: meuveFonce),
                            ),
                          )
                        : isSelect == 0
                            ? GestureDetector(
                                onTap: () => setState(() {
                                  isSelect = 1;
                                }),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: meuveFonce),
                                ),
                              )
                            : isSelect == 2
                                ? GestureDetector(
                                    onTap: () => setState(() {
                                      isSelect = 0;
                                    }),
                                    child: Text(
                                      "to cancel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: meuveFonce),
                                    ),
                                  )
                                : Text(""),
                    SizedBox(
                      width: size.width * .1,
                    )
                  ],
                ),
                // if (isSelect == 1 || isSelect == 2)
                //   Container(
                //     child: Column(
                //       children: [
                //         SizedBox(
                //           height: size.height * .02,
                //         ),
                //         Row(
                //           children: [
                //             SizedBox(
                //               width: size.width * .05,
                //             ),
                //             Icon(
                //               Icons.delete_rounded,
                //               color: meuveFonce,
                //             ),
                //             SizedBox(
                //               width: size.width * .01,
                //             ),
                //             GestureDetector(
                //               onTap: () async {},
                //               child: Text(
                //                 "Delete selected items",
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.w300,
                //                     color: meuveFonce),
                //               ),
                //             ),
                //             SizedBox(
                //               width: size.width * .1,
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  child: Column(
                    children: listeOrderItems
                        .map(
                          (e) => Container(
                            height: size.height * .13,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListProduitMonPannierItemWidget(
                                isSelectable: isSelect,
                                idOrder: e.id,
                                orderItemModel: e,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: size.height * .2,
                )
              ],
            ),
          )),
          Positioned(
              bottom: 0,
              left: size.width * .05,
              child: Container(
                height: size.height * .15,
                width: size.width * .9,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'Total order ',
                            style: TextStyle(
                                fontSize: size.width * .027,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: size.width * .03,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            '$priceTotalPannier NGN ',
                            style: TextStyle(
                                fontSize: size.width * .030,
                                fontWeight: FontWeight.w300,
                                color: meuveFonce),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: gris, borderRadius: BorderRadius.circular(8)),
                    )),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                        child: Container(
                      child: BtnByDiiConnexion(
                          titre: "Buy Now",
                          onTap: () async {
                            if (listeOrderItems.length > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConfirmationCommande()));
                            } else {
                              Fluttertoast.showToast(
                                      msg: "no items selected",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Colors.red.withOpacity(.5),
                                      textColor: Colors.white,
                                      fontSize: 16.0)
                                  .then((value) async {
                                await Future.delayed(Duration(seconds: 2));
                                Navigator.pop(context);
                              });
                            }
                            // ignore: use_build_context_synchronously
                          },
                          bgNormal: 1),
                    )),
                    SizedBox(
                      height: size.height * .02,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
