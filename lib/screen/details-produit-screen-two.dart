import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/ajouter-au-panier.dart';
import 'package:deally_app/screen/confirmation_commande.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/list-produit-item-widget.dart';
import 'package:deally_app/widgets/marge-prix-widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProduitScreenTwo extends StatefulWidget {
  final ProduitModel produitModel;
  const DetailProduitScreenTwo({Key? key, required this.produitModel})
      : super(key: key);

  @override
  _DetailProduitScreenTwoState createState() => _DetailProduitScreenTwoState();
}

class _DetailProduitScreenTwoState extends State<DetailProduitScreenTwo> {
  late Size size;
  int nomreProduit = 0;
  int marge = 50;
  late int prixTotal;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.produitModel.id);
    setState(() {
      prixTotal = widget.produitModel.packDiscounts.first.min *
          widget.produitModel.packDiscounts.first.price;
      nomreProduit = widget.produitModel.packDiscounts.first.min;
    });
  }

  int getPrice(int nbre, int prixUnite) {
    return nbre * prixUnite;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: 'search shopping ',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      backgroundColor: blanc,
      body: Column(
        children: [
          SizedBox(
            height: size.height * .02,
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .005,
                  ),
                  Text(
                    '    unit price ${widget.produitModel.packDiscounts.first.min} minimum pieces    ',
                    style: TextStyle(
                        color: blanc,
                        fontSize: size.height * .015,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: size.height * .005,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: noir.withOpacity(.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            height: size.height * .09,
            width: size.width,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                        child: MargePrixWidget(
                  isSelected: nomreProduit >=
                          widget.produitModel.packDiscounts[0].min &&
                      nomreProduit < widget.produitModel.packDiscounts[1].min,
                  onPress: () {
                    setState(() {
                      nomreProduit = widget.produitModel.packDiscounts[0].min;
                      prixTotal = getPrice(
                          widget.produitModel.packDiscounts[0].min,
                          widget.produitModel.packDiscounts[0].price);
                    });
                  },
                  packDiscountsModel: widget.produitModel.packDiscounts.first,
                ))),
                Expanded(
                    child: Center(
                        child: MargePrixWidget(
                            isSelected: nomreProduit >=
                                    widget.produitModel.packDiscounts[1].min &&
                                nomreProduit <
                                    widget.produitModel.packDiscounts[2].min,
                            onPress: () {
                              setState(() {
                                nomreProduit =
                                    widget.produitModel.packDiscounts[1].min;
                                prixTotal = getPrice(
                                    widget.produitModel.packDiscounts[1].min,
                                    widget.produitModel.packDiscounts[1].price);
                              });
                            },
                            packDiscountsModel:
                                widget.produitModel.packDiscounts[1]))),
                Expanded(
                    child: Center(
                        child: MargePrixWidget(
                            isSelected: nomreProduit >=
                                widget.produitModel.packDiscounts[2].min,
                            onPress: () {
                              setState(() {
                                nomreProduit =
                                    widget.produitModel.packDiscounts[2].min;
                                prixTotal = getPrice(
                                    widget.produitModel.packDiscounts[2].min,
                                    widget.produitModel.packDiscounts[2].price);
                              });
                            },
                            packDiscountsModel:
                                widget.produitModel.packDiscounts[2]))),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .07,
              ),
              Text(
                'Quantity',
                style: TextStyle(
                    fontSize: size.width * .05, fontWeight: FontWeight.w300),
              )
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            width: size.width,
            height: size.height * .12,
            child: ListProduitItemWidget(
              nbre: nomreProduit,
              produitModel: widget.produitModel,
              decremente: () {
                if (widget.produitModel.packDiscounts.first.min <
                    nomreProduit) {
                  setState(() {
                    nomreProduit -= 5;
                    prixTotal = getPrice(
                        nomreProduit,
                        nomreProduit >
                                widget.produitModel.packDiscounts.first.max
                            ? nomreProduit >
                                    widget.produitModel.packDiscounts[1].max
                                ? widget.produitModel.packDiscounts[2].price
                                : widget.produitModel.packDiscounts[1].price
                            : widget.produitModel.packDiscounts.first.price);
                  });
                }
              },
              incremente: () {
                if (int.parse(widget.produitModel.stock) > nomreProduit) {
                  setState(() {
                    nomreProduit += 5;
                    prixTotal = getPrice(
                        nomreProduit,
                        nomreProduit >
                                widget.produitModel.packDiscounts.first.max
                            ? nomreProduit >
                                    widget.produitModel.packDiscounts[1].max
                                ? widget.produitModel.packDiscounts[2].price
                                : widget.produitModel.packDiscounts[1].price
                            : widget.produitModel.packDiscounts.first.price);
                  });
                }
              },
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              height: size.height * .05,
              width: size.width * .95,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Text(
                    '$nomreProduit pieces',
                    style: TextStyle(
                        fontSize: size.width * .027,
                        fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: size.width * .03,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Text(
                    // ignore: prefer_adjacent_string_concatenation
                    '$prixTotal' + ' NGN',
                    style: TextStyle(
                        fontSize: size.width * .030,
                        fontWeight: FontWeight.w300,
                        color: meuveFonce),
                  ),
                  SizedBox(
                    width: size.width * .07,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: gris.withOpacity(.5)),
            ),
          ),
          SizedBox(height: size.height * .01),
          Container(
            height: size.height * .06,
            width: size.width,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                  child: BtnByDiiConnexion(
                      titre: "Add to Cart",
                      onTap: () async {
                        print(widget.produitModel.id);
                        await postResponse(url: '/order-items', body: {
                          "quantite": nomreProduit,
                          "product": widget.produitModel.id,
                          "price": prixTotal.toString(),
                          "statusClient": 'PANNIER'
                        }).then((value) async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAuPannier(
                                        nbre: nomreProduit,
                                        produitModel: widget.produitModel,
                                      )));
                        });
                      },
                      bgNormal: 3),
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                  child: BtnByDiiConnexion(
                      titre: "order",
                      onTap: () async {
                        print(widget.produitModel.id);
                        await postResponse(url: '/order-items', body: {
                          "quantite": nomreProduit,
                          "product": widget.produitModel.id,
                          "price": prixTotal.toString(),
                          "statusClient": 'PANNIER'
                        }).then((value) async {
                          print(value);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConfirmationCommande()));
                        });
                      },
                      bgNormal: 1),
                ),
                SizedBox(
                  width: size.width * .02,
                )
              ],
            ),
          ),
          SizedBox(height: size.height * .02),
        ],
      ),
    );
  }
}
