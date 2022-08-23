import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderPrepare extends StatefulWidget {
  const OrderPrepare({Key? key}) : super(key: key);

  @override
  State<OrderPrepare> createState() => _OrderPrepareState();
}

class _OrderPrepareState extends State<OrderPrepare> {
  late Size size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderPrepare();
  }

  getOrderPrepare() async {
    await getResponse(url: '/orders/byShop').then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        title: Text(
          'Order to prepare',
          style: TextStyle(
              fontSize: size.height * .03,
              color: blanc,
              fontWeight: FontWeight.w300),
        ),
        elevation: .0,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
