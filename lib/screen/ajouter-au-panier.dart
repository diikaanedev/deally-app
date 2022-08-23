import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/fournisseur/home-page-screen.dart';
import 'package:deally_app/screen/home-page-screen.dart';
import 'package:deally_app/screen/mon-panier.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/list-produit-item-widget.dart';
import 'package:flutter/material.dart';

class AddAuPannier extends StatefulWidget {
  final ProduitModel? produitModel;
  final int nbre;
  const AddAuPannier({Key? key, required this.nbre, l, this.produitModel})
      : super(key: key);

  @override
  _AddAuPannierState createState() => _AddAuPannierState();
}

class _AddAuPannierState extends State<AddAuPannier> {
  late Size size;

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
              nbre: widget.nbre,
              produitModel: widget.produitModel,
              haveFunc: true,
              decremente: () => null,
              incremente: () => null,
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              height: size.height * .05,
              width: size.width * .9,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MonPanier(),
                    )),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: size.width * .027,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'See cart',
                      style: TextStyle(
                          fontSize: size.width * .03,
                          color: meuveFonce,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: size.width * .03,
                      color: meuveFonce,
                    ),
                    SizedBox(
                      width: size.width * .07,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: gris.withOpacity(.5)),
            ),
          ),
          SizedBox(height: size.height * .02),
          Container(
            height: size.height * .05,
            width: size.width,
            child: Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageScreen(),
                      )),
                  child: Container(
                    width: size.width * .9,
                    child: Center(
                      child: Text(
                        'See other products'.toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * .03,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: noir, width: .5),
                        borderRadius: BorderRadius.circular(size.width * .02)),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: size.height * .02),
        ],
      ),
    );
  }
}
