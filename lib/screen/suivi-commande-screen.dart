import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/suivi-commande-widget.dart';
import 'package:flutter/material.dart';

class SuiviCommande extends StatefulWidget {
  const SuiviCommande({Key? key}) : super(key: key);

  @override
  State<SuiviCommande> createState() => _SuiviCommandeState();
}

class _SuiviCommandeState extends State<SuiviCommande> {
  late Size size;
  List<OrderItemModel> liste = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCommande();
  }

  getCommande() async {
    await getResponse(url: '/order-items/orderClient').then((value) {
      print(value['data']);
      setState(() {
        liste = OrderItemModel.fromList(data: value['data']);
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
        child: ListView(
          children: [
            SizedBox(
              height: size.height * .03,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .1,
                ),
                Text(
                  'Track my orders',
                  style: TextStyle(
                      fontSize: size.height * .02,
                      fontWeight: FontWeight.w300,
                      color: meuveFonce),
                )
              ],
            ),
            Column(
              children: liste.reversed
                  .map(
                    (e) => Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .02,
                          ),
                          Center(
                            child: Container(
                              height: size.height * .35,
                              width: size.width * .8,
                              child: SuiviCommandeWidget(
                                order: e,
                              ),
                              decoration: BoxDecoration(
                                  color: gris,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
