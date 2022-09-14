import 'package:deally_app/models/order-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/fournisseur/order-prepare-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderPrepare extends StatefulWidget {
  const OrderPrepare({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<OrderPrepare> createState() => _OrderPrepareState();
}

class _OrderPrepareState extends State<OrderPrepare> {
  late Size size;
  int choix = 2;
  List<OrderModel> orders = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderPrepare();
  }

  getOrderPrepare() async {
    await getResponse(url: '/order-items/orderShop')
        .then((value) => setState(() {
              orders = OrderModel.fromJson(data: value['data']);
            }));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        title: Text(
          'Order to validate',
          style: TextStyle(
              fontSize: size.height * .03,
              color: blanc,
              fontWeight: FontWeight.w300),
        ),
        elevation: .0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * .02,
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
                                borderRadius: BorderRadius.circular(8))
                            : const BoxDecoration(),
                        child: Center(
                            child: Text('     Refused     ',
                                style: TextStyle(
                                    color: choix == 1 ? blanc : noir)))),
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
                                borderRadius: BorderRadius.circular(8))
                            : const BoxDecoration(),
                        child: Center(
                            child: Text(
                          '     Your orders     ',
                          style: TextStyle(color: choix == 2 ? blanc : noir),
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
                        child: Text('     Preparations     ',
                            style: TextStyle(color: choix == 3 ? blanc : noir)),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Column(
            children: orders
                .where((element) => choix == 2
                    ? element.statusShop == "CREATE"
                    : choix == 1
                        ? element.statusShop == "CANCELED"
                        : element.statusShop == "FINISHED")
                .map((e) => SizedBox(
                    height: size.height * .2,
                    child: OrderToPrepareObject(
                      orderModel: e,
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
