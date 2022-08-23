import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-name.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieFournisseurSonWidget extends StatefulWidget {
  final CategorieShopList categorieShopList;
  final Function ontap;
  const CategorieFournisseurSonWidget(
      {Key? key, required this.categorieShopList, required this.ontap})
      : super(key: key);

  @override
  State<CategorieFournisseurSonWidget> createState() =>
      _CategorieFournisseurSonWidgetState();
}

class _CategorieFournisseurSonWidgetState
    extends State<CategorieFournisseurSonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.ontap(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  // ignore: sort_child_properties_last
                  child: Column(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.categorieShopList.url),
                                      fit: BoxFit.cover),
                                  // borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Center(
                              child: Text(
                                '${widget.categorieShopList.nom}',
                                style: TextStyle(color: blanc),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: meuveFonce,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ))
                    ],
                  ),
                  // decoration: BoxDecoration(color: noir),
                  // borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
