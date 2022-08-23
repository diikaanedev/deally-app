import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/produit-home-widget.dart';
import 'package:deally_app/widgets/suivi-expedition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuiviScreen extends StatefulWidget {
  final OrderItemModel order;
  const SuiviScreen({Key? key, required this.order}) : super(key: key);

  @override
  State<SuiviScreen> createState() => _SuiviScreenState();
}

class _SuiviScreenState extends State<SuiviScreen> {
  late Size size;

  List<ProduitModel> listeProduct = [];
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() async {
    await getResponse(url: '/products').then((value) {
      // print(value['data'][0]['attributes']['image']['data']);
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .03,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .075,
                ),
                Text(
                  'Followed by ${widget.order.ref}',
                  style: TextStyle(
                      fontSize: size.height * .02,
                      fontWeight: FontWeight.w300,
                      color: meuveFonce),
                )
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                height: size.height * .35,
                width: size.width * .85,
                // ignore: sort_child_properties_last
                child: SuiviExpeditionWidget(
                  order: widget.order,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: gris,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .1,
                ),
                Text(
                  'Recommended for you',
                  style: TextStyle(
                      fontSize: size.height * .02, fontWeight: FontWeight.w300),
                )
              ],
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Container(
              height: size.height * .35,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16.0),
                children: listeProduct
                    .map(
                      (e) => Container(
                        width: size.width * .45,
                        height: size.height * .35,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProduitHomeWidget(
                            produitModel: e,
                          ),
                        )),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
