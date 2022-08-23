import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/screen/adresse-livraison-screen.dart';
import 'package:deally_app/screen/edit-adress.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdresseLivraisonWidgetAll extends StatefulWidget {
  final AdresseModel adresse;
  final String city, bp, nom, rue, numero, contry, asset_contry;
  final bool isMap, isDefault;

  const AdresseLivraisonWidgetAll({
    Key? key,
    required this.city,
    required this.bp,
    required this.nom,
    required this.rue,
    required this.numero,
    required this.contry,
    required this.asset_contry,
    this.isMap = false,
    this.isDefault = false,
    required this.adresse,
  }) : super(key: key);

  @override
  _AdresseLivraisonWidgetAllState createState() =>
      _AdresseLivraisonWidgetAllState();
}

class _AdresseLivraisonWidgetAllState extends State<AdresseLivraisonWidgetAll> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          SizedBox(
            width: constraints.maxWidth * .02,
          ),
          widget.isMap
              ? Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        width: 20,
                        height: 20,
                        // ignore: sort_child_properties_last
                        child: widget.isDefault
                            ? Center(
                                child: Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: meuveFonce,
                                ),
                              )
                            : Center(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: noir, width: .2)),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                    ],
                  ))
              : Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            if (widget.adresse.isDefault) {
                              await putResponse(
                                  url: '/address/' + widget.adresse.id,
                                  body: {"isDefault": false});
                            } else {
                              await putResponse(
                                  url: '/address/' + widget.adresse.id,
                                  body: {"isDefault": true});
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AdresseLivraisonScreen(),
                                ));
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            // ignore: sort_child_properties_last
                            child: widget.isDefault
                                ? Center(
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: meuveFonce,
                                    ),
                                  )
                                : Center(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: noir, width: .2)),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
          Expanded(
              flex: 9,
              child: Container(
                // ignore: sort_child_properties_last
                child: widget.adresse.isMap
                    ? Column(
                        children: [
                          if (widget.adresse.isDefault)
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .15,
                                  width: constraints.maxWidth * .25,
                                  // ignore: sort_child_properties_last
                                  child: Center(
                                    child: Text(
                                      'By default',
                                      style: TextStyle(
                                          color: meuveFonce,
                                          fontSize: constraints.maxHeight * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8)),
                                      color: meuveFonce.withOpacity(.3)),
                                ),
                              ],
                            ),
                          widget.adresse.isDefault
                              ? SizedBox()
                              : SizedBox(
                                  height: constraints.maxHeight * .03,
                                ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                "${widget.adresse.firstName} ${widget.adresse.lastName} ",
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Image.asset(
                                widget.asset_contry,
                                height: 15,
                                width: 15,
                              ),
                              Text(
                                ' ${widget.adresse.phoneNumber} ',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ),
                              Spacer(),
                              //TODO : edit adresss after
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditAddress(address: widget.adresse),
                                    )),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .08,
                                      fontWeight: FontWeight.w300,
                                      color: noir),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: constraints.maxHeight * .06,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              )
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .04,
                          ),
                          Container(
                            height: widget.isDefault
                                ? constraints.maxHeight * .55
                                : constraints.maxHeight * .65,
                            width: constraints.maxWidth * .84,
                            decoration: const BoxDecoration(
                                // color: rouge,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/map.png"),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .25,
                                  width: constraints.maxWidth * .1,
                                  child: Center(
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                        child: Icon(
                                          Icons.circle,
                                          size: 15,
                                          color: meuveFonce,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: blanc,
                                          border: Border.all(
                                              color: noir, width: .2)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: meuveFonce.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(
                                          constraints.maxHeight * .3)),
                                ),
                                Spacer()
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          if (widget.adresse.isDefault)
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .15,
                                  width: constraints.maxWidth * .25,
                                  child: Center(
                                    child: Text(
                                      'By default',
                                      style: TextStyle(
                                          color: meuveFonce,
                                          fontSize: constraints.maxHeight * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8)),
                                      color: meuveFonce.withOpacity(.3)),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                "${widget.adresse.firstName} ${widget.adresse.lastName} ",
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                "${widget.adresse.addr1},${widget.adresse.addr2} ",
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                '${widget.adresse.city} ,${widget.adresse.zipcode}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                widget.adresse.contry == null
                                    ? ''
                                    : widget.adresse.contry.toLowerCase(),
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Image.asset(
                                widget.asset_contry,
                                height: 15,
                                width: 15,
                              ),
                              Text(
                                '${widget.adresse.phoneNumber} ',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ),
                              Spacer(),
                              //TODO : edit adresss after
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditAddress(address: widget.adresse),
                                    )),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .08,
                                      fontWeight: FontWeight.w300,
                                      color: noir),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: constraints.maxHeight * .06,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              )
                            ],
                          )
                        ],
                      ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: noir.withOpacity(.6))),
              )),
          SizedBox(
            width: constraints.maxWidth * .02,
          ),
        ],
      ),
    );
  }
}
