import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/moyen_payement_widget_select.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaiementScreen extends StatefulWidget {
  const PaiementScreen({Key? key}) : super(key: key);

  @override
  State<PaiementScreen> createState() => _PaiementScreenState();
}

class _PaiementScreenState extends State<PaiementScreen> {
  late Size size;
  late int choix;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChoix();
  }

  getChoix() async {
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("paiement_method")) {
        setState(() {
          choix = value.getInt("paiement_method")!;
        });
      } else {
        setState(() {
          choix = 0;
        });
      }
    });
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
                top: 0,
                child: Container(
                  height: size.height * .75,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .07,
                            ),
                            Text(
                              'Means of payment '.toUpperCase(),
                              style: TextStyle(
                                fontSize: size.width * .035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "assets/images/banktrfrr.png",
                            onTap: () async {
                              setState(
                                () {
                                  choix = 0;
                                },
                              );
                            },
                            title: "Pay with bank transfer at delivery",
                            isCreditOrCash: false,
                            subTitle: "UBA (Deally) : 2174858061",
                            isDefault: choix == 0,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "assets/images/pos-removebg-preview.png",
                            onTap: () async {
                              setState(
                                () {
                                  choix = 1;
                                },
                              );
                            },
                            isDefault: choix == 1,
                            isCreditOrCash: false,
                            title: "Pay with POS at delivery",
                            subTitle: "",
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url:
                                "assets/images/cash-removebg-preview.png",
                            onTap: () async {
                              setState(
                                () {
                                  choix = 2;
                                },
                              );
                            },
                            subTitle: "",
                            isCreditOrCash: false,
                            isDefault: choix == 2,
                            title: "Cash Payment at Delivery",
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "assets/images/advans_logo.png",
                            onTap: () async {
                              setState(
                                () {
                                  choix = 3;
                                },
                              );
                            },
                            isCreditOrCash: true,
                            subTitle:
                                "To be validate within 3 days by our partner",
                            title: "Pay by microfinancing",
                            isDefault: choix == 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: size.height * .02,
                left: size.width * .05,
                child: Container(
                  height: size.height * .09,
                  width: size.width * .9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await SharedPreferences.getInstance().then(
                                (prefs) =>
                                    prefs.setInt("paiement_method", choix));
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: size.width * .9,
                            child: Center(
                              child: Text(
                                'Save'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: size.width * .03,
                                    color: blanc,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: meuveFonce,
                                borderRadius:
                                    BorderRadius.circular(size.width * .02)),
                          ),
                        ),
                      ),
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
