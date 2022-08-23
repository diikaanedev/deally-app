import 'package:deally_app/models/categorie_by_dii.dart';
import 'package:deally_app/screen/fournisseur/add-product-name.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieFournisseurWidget extends StatefulWidget {
  final CategorieShopList categorieShopList;
  final Function ontap;
  const CategorieFournisseurWidget(
      {Key? key, required this.categorieShopList, required this.ontap})
      : super(key: key);

  @override
  State<CategorieFournisseurWidget> createState() =>
      _CategorieFournisseurWidgetState();
}

class _CategorieFournisseurWidgetState
    extends State<CategorieFournisseurWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => widget.ontap(),
        child: Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          decoration: BoxDecoration(border: Border.all(color: gris, width: .5)),
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Container(
                width: constraints.maxWidth * .2,
                child: Image.network(
                  widget.categorieShopList.url,
                  height: constraints.maxHeight * .7,
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Text(
                '${widget.categorieShopList.nom}',
                style: TextStyle(
                    fontSize: constraints.maxHeight * .25,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
