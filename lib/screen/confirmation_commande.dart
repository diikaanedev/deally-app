import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/screen/commercants/compte-ui/moyen_payement_widget.dart';
import 'package:deally_app/screen/commercants/compte-ui/paiement-scren.dart';
import 'package:deally_app/screen/payement-reussi.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/adresse_livraison_widget.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/list_produit_item_widget_cmd.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

late _ConfirmationCommandeState confirmCmd;

class ConfirmationCommande extends StatefulWidget {
  const ConfirmationCommande({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ConfirmationCommandeState createState() {
    confirmCmd = _ConfirmationCommandeState();
    return confirmCmd;
  }
}

class _ConfirmationCommandeState extends State<ConfirmationCommande> {
  late Size size;
  String assetUlr = "assets/images/orange-money.png";
  int priceTotalPannier = 0;

  List<AdresseModel> address = [];

  List<OrderItemModel> listeOrderItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAssetUrlPaiement();
    getListOrderItem();
    getAddressDefault();
  }

  getAssetUrlPaiement() async {
    await SharedPreferences.getInstance().then((prefs) {
      if (prefs.containsKey("paiement_method")) {
        if (prefs.getInt("paiement_method") == 0) {
          setState(() {
            assetUlr = "assets/images/orange-money.png";
          });
        }
        if (prefs.getInt("paiement_method") == 1) {
          setState(() {
            assetUlr = "assets/images/mtn-logo.png";
          });
        }
        if (prefs.getInt("paiement_method") == 2) {
          setState(() {
            assetUlr = "assets/images/wave.png";
          });
        }
      } else {
        setState(() {
          assetUlr = "assets/images/orange-money.png";
        });
      }
    });
  }

  getListOrderItem() async {
    await getResponse(url: "/order-items").then((value) {
      print(value);
      setState(() {
        listeOrderItems = OrderItemModel.fromList(data: value['data']);
      });
    });
    for (var item in listeOrderItems) {
      setState(() {
        priceTotalPannier += item.price;
      });
    }
  }

  getAddressDefault() async {
    await getResponse(url: '/address/meDefault').then((value) => setState(() {
          address = AdresseModel.fromJson(data: value['data']);
        }));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
            ),
            Positioned(
              child: Container(
                height: size.height * .75,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .07,
                          ),
                          Text(
                            'Order confirmation'.toUpperCase(),
                            style: TextStyle(
                              fontSize: size.width * .035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Center(
                        child: Container(
                          height: constraints.maxHeight * .2,
                          width: constraints.maxWidth * .9,
                          decoration: BoxDecoration(
                              color: gris,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * .05)),
                          child: AdresseLivraisonWidget(
                            adresse: address.isNotEmpty
                                ? address.first
                                : AdresseModel(
                                    id: "",
                                    name: "",
                                    addr1: "",
                                    addr2: "",
                                    city: "",
                                    contry: "",
                                    zipcode: "",
                                    phoneNumber: "",
                                    firstName: "",
                                    lastName: "",
                                    isDefault: false,
                                    isMap: false),
                            haveAddress: address.isNotEmpty,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaiementScreen(),
                              )),
                          child: Container(
                            height: constraints.maxHeight * .15,
                            width: constraints.maxWidth * .9,
                            child: MoyenPayementWidget(
                              asseturl: assetUlr,
                            ),
                            decoration: BoxDecoration(
                                color: gris,
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth * .05)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: constraints.maxWidth * .07),
                        child: Text(
                          "Products",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: constraints.maxWidth * .04),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Column(
                        children: listeOrderItems
                            .map(
                              (e) => Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: constraints.maxHeight * .15,
                                      width: constraints.maxWidth * .9,
                                      child: ListProduitItemWidgetCmd(
                                        orderItemModel: e,
                                      ),
                                      decoration: BoxDecoration(
                                          color: blanc,
                                          borderRadius: BorderRadius.circular(
                                              constraints.maxWidth * .05)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .02,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: size.height * .07,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: size.height * .0,
                left: size.width * .05,
                right: size.width * .05,
                child: Container(
                  height: size.height * .2,
                  width: size.width,
                  color: gris.withOpacity(.1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              'Service Fee',
                              style: TextStyle(
                                  fontSize: size.width * .027,
                                  fontWeight: FontWeight.w300),
                            ),
                            // FutureBuilder<SharedPreferences>(
                            //     future: SharedPreferences.getInstance(),
                            //     builder: (context, snapshot) {
                            //       List<String> l =
                            //           snapshot.data!.getStringList("pannier")!;
                            //       return Text(
                            //         'Service Fee',
                            //         style: TextStyle(
                            //             fontSize: size.width * .027,
                            //             fontWeight: FontWeight.w300),
                            //       );
                            //     }),
                            Spacer(),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              '${(priceTotalPannier * .22).round()} NGN',
                              style: TextStyle(
                                  fontSize: size.width * .030,
                                  fontWeight: FontWeight.w300,
                                  color: noir),
                            ),
                            SizedBox(
                              width: size.width * .05,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: gris,
                            borderRadius: BorderRadius.circular(8)),
                      )),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                            // FutureBuilder<SharedPreferences>(
                            //     future: SharedPreferences.getInstance(),
                            //     builder: (context, snapshot) {
                            //       List<String> l =
                            //           snapshot.data!.getStringList("pannier")!;
                            //       return Text(
                            //         '${listeOrderItems.length} articles',
                            //         style: TextStyle(
                            //             fontSize: size.width * .027,
                            //             fontWeight: FontWeight.w300),
                            //       );
                            //     }),
                            Spacer(),

                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              '${priceTotalPannier + (priceTotalPannier * .22).round()} NGN',
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
                            color: gris,
                            borderRadius: BorderRadius.circular(8)),
                      )),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                          child: Container(
                        child: BtnByDiiConnexion(
                            titre: "Pay now ",
                            onTap: () async {
                              if (address.isNotEmpty) {
                                await postResponse(url: '/orders', body: {
                                  "livraison": address.first.id,
                                  "items":
                                      listeOrderItems.map((e) => e.id).toList(),
                                  "amount": (priceTotalPannier +
                                          (priceTotalPannier * .22).round())
                                      .toString(),
                                }).then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PayementReussiScreen(
                                                id: value['body']['data']
                                                    ['_id'],
                                              )));
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "You have a delivery address or you have not selected it",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            bgNormal: 1),
                      )),
                      SizedBox(
                        height: size.height * .01,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
