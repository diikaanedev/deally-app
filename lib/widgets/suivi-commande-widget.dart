import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/suivi-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/get-date.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuiviCommandeWidget extends StatefulWidget {
  final OrderItemModel order;
  const SuiviCommandeWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<SuiviCommandeWidget> createState() => _SuiviCommandeWidgetState();
}

class _SuiviCommandeWidgetState extends State<SuiviCommandeWidget> {
  ProduitModel produit = const ProduitModel(
      id: "",
      name: "",
      description: "",
      location: "",
      saleEnd: "",
      stock: "",
      deliveryDelay: "",
      brand: "",
      storageCondition: "",
      images: "",
      packDiscounts: [],
      listImage: [],
      price: 0,
      rating: "5");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  getProduct() async {
    await getResponse(url: '/products/' + widget.order.produitModel)
        .then((value) {
      setState(() {
        produit = ProduitModel.fromObject(value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: constraints.maxHeight * .8,
                        width: constraints.maxWidth * .25,
                        decoration: BoxDecoration(
                            color: blanc,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Image.network(produit.images == ""
                                ? "http://isarta.com/infos/wp-content/uploads/2015/10/chargement-vitesse.png"
                                : produit.images)),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                width: constraints.maxWidth * .6,
                                child: Text(
                                  '${produit.name}',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .03,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .02,
                              ),
                              Container(
                                width: constraints.maxWidth * .6,
                                child: Text(
                                  '${widget.order.quantity} item',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .03,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: constraints.maxHeight * .05,
                              ),
                              Container(
                                height: constraints.maxHeight * .18,
                                width: constraints.maxWidth * .6,
                                child: Center(
                                    child: Text(
                                  "${widget.order.price} NGN",
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .03,
                                      fontWeight: FontWeight.w300),
                                )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: blanc),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Container(
                          // height: constraints.maxHeight * .07,
                          child: Center(
                            child: Text(
                              'Order date: ${getFormatedDate(widget.order.date)}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .01,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Container(
                          // height: constraints.maxHeight * .07,
                          child: Center(
                            child: Text(
                              'Order number: ${widget.order.ref}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .01,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Container(
                          // height: constraints.maxHeight * .07
                          child: Center(
                            child: Text(
                              'Order status: ${widget.order.status == "CREATE" ? "In progress" : "Delivery"}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: constraints.maxHeight * .04,
          ),
          Center(
            child: Container(
              height: .5,
              width: constraints.maxWidth * .8,
              color: noir,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * .04,
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Text(
                          'Total ',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .03,
                              fontWeight: FontWeight.w200),
                        ),
                        Spacer(),
                        Text(
                          '${widget.order.price} NGN',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .03,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .03,
                        ),
                      ],
                    )),
                    SizedBox(
                      height: constraints.maxHeight * .05,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuiviScreen(
                                      order: widget.order,
                                    ))),
                        child: Container(
                          height: constraints.maxHeight * .15,
                          width: constraints.maxWidth * .8,
                          child: Center(
                            child: Text(
                              'Order Tracking',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .05,
                                  color: meuveFonce,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: meuveFonce)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * .05,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
