import 'package:deally_app/screen/fournisseur/home-screen.dart';
import 'package:deally_app/screen/fournisseur/revenue-fournisseut.dart';
import 'package:deally_app/screen/fournisseur/stock-screen-fournisseur.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBottomByDiiFournisseur extends StatefulWidget {
  final int choix;
  const MenuBottomByDiiFournisseur({Key? key, required this.choix})
      : super(key: key);

  @override
  _MenuBottomByDiiFournisseurState createState() =>
      _MenuBottomByDiiFournisseurState();
}

class _MenuBottomByDiiFournisseurState
    extends State<MenuBottomByDiiFournisseur> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth * .8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(constraints.maxWidth * .1),
              color: meuveFonce),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => widget.choix != 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeFournisseurScreen(),
                        ))
                    : null,
                child: Center(
                  child: Icon(
                    CupertinoIcons.house_alt,
                    color: widget.choix == 0 ? blanc : blanc.withOpacity(.4),
                    size: constraints.maxWidth * .05,
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => widget.choix != 1
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StockScreenFournisseur(),
                        ))
                    : null,
                child: Center(
                  child: Icon(
                    Icons.shop,
                    color: widget.choix == 1 ? blanc : blanc.withOpacity(.4),
                    size: constraints.maxWidth * .05,
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => widget.choix != 2
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RevenueFournisseur(),
                        ))
                    : null,
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: widget.choix == 2 ? blanc : blanc.withOpacity(.4),
                    size: constraints.maxWidth * .05,
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => widget.choix != 3
                    ? Navigator.popAndPushNamed(context, '/home-menu')
                    : null,
                child: Center(
                  child: Icon(
                    CupertinoIcons.person_crop_circle,
                    color: widget.choix == 3 ? blanc : blanc.withOpacity(.4),
                    size: constraints.maxWidth * .05,
                  ),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}
