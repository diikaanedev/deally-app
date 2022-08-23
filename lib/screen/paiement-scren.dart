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
                            asset_url: "assets/images/orange-money.png",
                            onTap: () => {
                              setState(
                                () {
                                  choix = 0;
                                },
                              )
                            },
                            title: "Orange Money",
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
                            asset_url: "assets/images/mtn-logo.png",
                            onTap: () => {
                              setState(
                                () {
                                  choix = 1;
                                },
                              )
                            },
                            isDefault: choix == 1,
                            title: "MTN Mobile Money",
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "assets/images/wave.png",
                            onTap: () => {
                              setState(
                                () {
                                  choix = 2;
                                },
                              )
                            },
                            title: "Wave",
                            isDefault: choix == 2,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "assets/images/wave.png",
                            onTap: () => {
                              setState(
                                () {
                                  choix = 3;
                                },
                              )
                            },
                            isCreditOrCash: false,
                            subTitle: "Remboursable sous 2 semaines .",
                            title: "À crédit",
                            isDefault: choix == 3,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .12,
                          width: constraints.maxWidth,
                          child: MoyenPayementWidgetSelect(
                            asset_url: "",
                            onTap: () => {
                              setState(
                                () {
                                  choix = 4;
                                },
                              )
                            },
                            subTitle:
                                "À payer au livreur au moment de la livraison.",
                            isCreditOrCash: false,
                            isDefault: choix == 4,
                            title: "Cash",
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
                          },
                          child: Container(
                            width: size.width * .9,
                            child: Center(
                              child: Text(
                                'Enregister'.toUpperCase(),
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
