import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/screen/adresse-livraison-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdresseLivraisonWidget extends StatefulWidget {
  final bool haveAddress;
  final AdresseModel adresse;
  const AdresseLivraisonWidget(
      {Key? key, required this.haveAddress, required this.adresse})
      : super(key: key);

  @override
  _AdresseLivraisonWidgetState createState() => _AdresseLivraisonWidgetState();
}

class _AdresseLivraisonWidgetState extends State<AdresseLivraisonWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdresseLivraisonScreen(),
            )),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                      Icon(
                        CupertinoIcons.placemark,
                        size: constraints.maxHeight * .15,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                      Text(
                        'Delivery address',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: noir,
                            fontSize: constraints.maxHeight * .12),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.chevron_right,
                        size: constraints.maxHeight * .2,
                        color: meuveFonce,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .02,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                              width: constraints.maxWidth * .9,
                              child: Text(
                                widget.adresse.firstName +
                                    ' ' +
                                    widget.adresse.lastName,
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ))),
                      Expanded(
                          child: Container(
                              width: constraints.maxWidth * .9,
                              child: Text(
                                '${widget.adresse.city} ${widget.adresse.addr1} ${widget.adresse.addr2}',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ))),
                      Expanded(
                          child: Container(
                              width: constraints.maxWidth * .9,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/drapeau-nigeria.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    ' ${widget.adresse.phoneNumber}',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .1,
                                        fontWeight: FontWeight.w300,
                                        color: noir),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
