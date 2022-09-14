import 'package:deally_app/models/order-model.dart';
import 'package:deally_app/models/revenue.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/price-format.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii-fournisseur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RevenueFournisseur extends StatefulWidget {
  const RevenueFournisseur({Key? key}) : super(key: key);

  @override
  State<RevenueFournisseur> createState() => _RevenueFournisseurState();
}

class _RevenueFournisseurState extends State<RevenueFournisseur> {
  late Size size;
  int i = 1;
  int choix = 1;
  int bankTranfert = 0;
  int confirmed = 0;
  int total = 0;

  // TODO : Nobre orders

  int bankNumber = 0;
  int confirmedNumber = 0;

  List<OrderModel> orders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallet();
  }

  getWallet() async {
    await getResponse(url: '/order-items/orderShop')
        .then((value) => setState(() {
              orders = OrderModel.fromJson(data: value['data']);
            }));

    print(orders.length);

    for (var element in orders) {
      bankTranfert += element.typePaiment == "BANK_TRANSFERT"
          ? int.parse(element.priceTotal)
          : 0;

      bankNumber += element.typePaiment == "BANK_TRANSFERT" ? 1 : 0;

      confirmed += element.typePaiment != "BANK_TRANSFERT"
          ? int.parse(element.priceTotal)
          : 0;

      confirmedNumber += element.typePaiment != "BANK_TRANSFERT" ? 1 : 0;
    }

    total = confirmed + bankTranfert;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * .25,
                      width: size.width,
                      child: Column(children: [
                        Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.search,
                              size: 30,
                              color: blanc,
                            ),
                            SizedBox(
                              width: size.width * .05,
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Wallet management",
                          style: TextStyle(
                              fontSize: size.height * .035,
                              color: blanc,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                      ]),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/revenu.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      height: size.height * .05,
                      // color: rouge,
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                choix = 1;
                              }),
                              child: Container(
                                  height: size.height * .04,
                                  width: size.width * .3,
                                  decoration: choix == 1
                                      ? BoxDecoration(
                                          color: meuveFonce,
                                          borderRadius:
                                              BorderRadius.circular(8))
                                      : const BoxDecoration(),
                                  child: Center(
                                      child: Text('     Total     ',
                                          style: TextStyle(
                                              color: choix == 1 ? blanc : noir,
                                              fontSize: 12)))),
                            ),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Center(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                choix = 2;
                              }),
                              child: Container(
                                  height: size.height * .04,
                                  width: size.width * .3,
                                  decoration: choix == 2
                                      ? BoxDecoration(
                                          color: meuveFonce,
                                          borderRadius:
                                              BorderRadius.circular(8))
                                      : const BoxDecoration(),
                                  child: Center(
                                      child: Text(
                                    '     Transfert     ',
                                    style: TextStyle(
                                        color: choix == 2 ? blanc : noir,
                                        fontSize: 12),
                                  ))),
                            ),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Center(
                            child: Container(
                              height: size.height * .04,
                              width: size.width * .3,
                              decoration: choix == 3
                                  ? BoxDecoration(
                                      color: meuveFonce,
                                      borderRadius: BorderRadius.circular(8))
                                  : const BoxDecoration(),
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  choix = 3;
                                }),
                                child: Center(
                                  child: Text('     To be confirmed     ',
                                      style: TextStyle(
                                          color: choix == 3 ? blanc : noir,
                                          fontSize: 12)),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        // GestureDetector(
                        //   onTap: () => setState(() {
                        //     i == 1 ? i = 2 : i = 1;
                        //   }),
                        //   child: CircleAvatar(
                        //     backgroundColor: meuveClair,
                        //     child: Center(
                        //       child: Icon(
                        //         CupertinoIcons.chevron_back,
                        //         color: meuveFonce,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: size.width * .1,
                        // ),
                        Text(
                          choix == 1
                              ? '$total NGN'
                              : choix == 2
                                  ? '$bankTranfert NGN'
                                  : '$confirmed NGN',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: meuveFonce,
                              fontSize: size.height * .03),
                        ),
                        // SizedBox(
                        //   width: size.width * .1,
                        // ),
                        // GestureDetector(
                        //   onTap: () => setState(() {
                        //     i == 1 ? i = 2 : i = 1;
                        //   }),
                        //   child: CircleAvatar(
                        //     backgroundColor: meuveClair,
                        //     child: Center(
                        //       child: Icon(
                        //         CupertinoIcons.chevron_forward,
                        //         color: meuveFonce,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    SizedBox(
                      height: size.height * .27,
                      width: size.width,
                      child: charts.BarChart(
                        i == 1 ? seriesFirst : seriesSecond,
                        animate: true,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: Container(
                        height: .2,
                        color: noir,
                        width: size.width * .9,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Number of orders  ',
                          style: TextStyle(
                            fontSize: size.height * .012,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Text(
                          choix == 1
                              ? orders.length.toString()
                              : choix == 2
                                  ? bankNumber.toString()
                                  : confirmedNumber.toString(),
                          style: TextStyle(fontSize: size.height * .014),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: Container(
                        height: .2,
                        color: noir,
                        width: size.width * .9,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Profit  ',
                          style: TextStyle(
                            fontSize: size.height * .012,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Text(
                          choix == 1
                              ? total.toString() + ' NGN'
                              : choix == 2
                                  ? bankTranfert.toString() + ' NGN'
                                  : confirmed.toString() + ' NGN',
                          style: TextStyle(fontSize: size.height * .014),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width * .9,
                      child: Center(
                        child: Text(
                          'Check the details'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: size.height * .014),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: gris)),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      height: size.height * .12,
                      color: gris,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.height * .03,
                              ),
                              Text(
                                'Balance : $bankTranfert NGN ',
                                style: TextStyle(
                                    fontSize: size.height * .016,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.height * .03,
                              ),
                              Text(
                                'Scheduled payment for ${DateTime.now().add(Duration(days: 15)).day} Avril ',
                                style: TextStyle(
                                    fontSize: size.height * .014,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .06,
                              ),
                              Container(
                                height: size.height * .04,
                                width: size.width * .3,
                                child: Center(
                                  child: Text(
                                    'COLLECT',
                                    style: TextStyle(
                                      color: blanc,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: noir.withOpacity(.8),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: size.height * .02,
                  child: Container(
                    height: size.height * .07,
                    width: size.width,
                    child: Center(
                        child: MenuBottomByDiiFournisseur(
                      choix: 2,
                    )),
                  ))
            ],
          )),
    );
  }
}
