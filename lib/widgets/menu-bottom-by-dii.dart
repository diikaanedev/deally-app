import 'package:deally_app/screen/categorie-screen.dart';
import 'package:deally_app/screen/fournisseur/home-page-screen.dart';
import 'package:deally_app/screen/mon-panier.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBottomByDii extends StatefulWidget {
  final int choix;
  const MenuBottomByDii({Key? key, required this.choix}) : super(key: key);

  @override
  _MenuBottomByDiiState createState() => _MenuBottomByDiiState();
}

class _MenuBottomByDiiState extends State<MenuBottomByDii> {
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
                          builder: (context) => const HomePageScreen(),
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
                          builder: (context) => const CategorieScreen(),
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
                          builder: (context) => const MonPanier(),
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
