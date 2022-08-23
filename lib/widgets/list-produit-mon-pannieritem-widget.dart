import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/screen/mon-panier.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/price-format.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';

class ListProduitMonPannierItemWidget extends StatefulWidget {
  final int isSelectable;
  final String idOrder;
  final OrderItemModel orderItemModel;
  const ListProduitMonPannierItemWidget(
      {Key? key,
      required this.isSelectable,
      required this.orderItemModel,
      required this.idOrder})
      : super(key: key);

  @override
  _ListProduitMonPannierItemWidgetState createState() =>
      _ListProduitMonPannierItemWidgetState();
}

class _ListProduitMonPannierItemWidgetState
    extends State<ListProduitMonPannierItemWidget> {
  late bool isSelect;
  late ProduitModel produitModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      isSelect = widget.isSelectable == 0
          ? true
          : widget.isSelectable == 2
              ? true
              : false;
    });
    print(widget.orderItemModel.quantity);
    print(widget.orderItemModel.price);
    getProduct();
  }

  Future<ProduitModel> getProduct() async {
    return getResponse(url: "/products/${widget.orderItemModel.produitModel}")
        .then((value) {
      return ProduitModel.fromObject(value['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => FutureBuilder<ProduitModel>(
          future: getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    if (widget.isSelectable == 0)
                      SizedBox(
                        width: constraints.maxWidth * .05,
                      ),
                    if (widget.isSelectable == 1 || widget.isSelectable == 2)
                      GestureDetector(
                        onTap: () async {
                          await deleteResponse(
                                  url: '/order-items/' + widget.idOrder)
                              .then((value) {
                            panier.getListOrderItem();
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .1,
                          height: constraints.maxHeight * .4,
                          child: Icon(
                            Icons.delete_rounded,
                            color: meuveFonce,
                          ),
                        ),
                      ),
                    Container(
                      width: constraints.maxWidth * .9,
                      // ignore: sort_child_properties_last
                      child: Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .02,
                          ),
                          Center(
                            child: Container(
                              width: constraints.maxWidth * .2,
                              height: constraints.maxHeight * .8,
                              child: Center(
                                child: Image.network(snapshot.data!.images),
                              ),
                              decoration: BoxDecoration(
                                  color: blanc,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width: constraints.maxWidth * .4,
                                  height: constraints.maxHeight * .6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "${snapshot.data!.name} ${snapshot.data!.brand}",
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * .035,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      // color: blanc,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  height: constraints.maxHeight * .4,
                                  width: constraints.maxWidth * .4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.orderItemModel.quantity} pieces",
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .03,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * .26,
                            height: constraints.maxHeight * .4,
                            child: Center(
                              child: Text(
                                "${priceFormatByDii(widget.orderItemModel.price)}",
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .02,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: blanc,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: gris.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    if (widget.isSelectable == 0)
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                  ],
                ),
              );
            } else {
              return Center(
                  child: Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
