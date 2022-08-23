// ignore_for_file: sized_box_for_whitespace

import 'package:deally_app/models/produit_by_dii.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';

class ListFacture extends StatefulWidget {
  final int isSelectable;
  final Invocation invocationModel;
  final Function onTap;
  const ListFacture(
      {Key? key,
      required this.isSelectable,
      required this.invocationModel,
      required this.onTap})
      : super(key: key);

  @override
  _ListFactureState createState() => _ListFactureState();
}

class _ListFactureState extends State<ListFacture> {
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
    getProduct();
  }

  Future<ProduitModel> getProduct() async {
    return getResponse(url: "products/${widget.invocationModel}?populate=*")
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
              return GestureDetector(
                onTap: () => widget.onTap(),
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        // ignore: sort_child_properties_last
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Center(
                              child: Container(
                                width: constraints.maxWidth * .3,
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
                                  SizedBox(
                                    height: constraints.maxHeight * .1,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .4,
                                    height: constraints.maxHeight * .2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Facture du 22/11/22",
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * .03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        // color: blanc,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .1,
                                  ),
                                  Container(
                                    height: constraints.maxHeight * .2,
                                    width: constraints.maxWidth * .4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "N°S345333454",
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * .03,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .1,
                                  ),
                                  Container(
                                    height: constraints.maxHeight * .2,
                                    width: constraints.maxWidth * .4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${widget.invocationModel} pièces",
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * .03,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: constraints.maxWidth * .25,
                              height: constraints.maxHeight * .3,
                              child: Center(
                                child: Text(
                                  "dgdgF",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * .025,
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
                    ],
                  ),
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
