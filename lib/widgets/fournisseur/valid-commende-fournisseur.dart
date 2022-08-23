import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ValidCommandeFournisseur extends StatefulWidget {
  const ValidCommandeFournisseur({Key? key}) : super(key: key);

  @override
  State<ValidCommandeFournisseur> createState() =>
      _ValidCommandeFournisseurState();
}

class _ValidCommandeFournisseurState extends State<ValidCommandeFournisseur> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * .05,
          ),
          Text(
            'orders S27009848 from 21/07/2021 at 12h:30',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: constraints.maxHeight * .035),
          ),
          SizedBox(
            height: constraints.maxHeight * .05,
          ),
          Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Image.asset(
                "assets/images/mayonaise-p.jpg",
                height: constraints.maxHeight * .25,
                width: constraints.maxWidth * .25,
              ),
              SizedBox(
                width: constraints.maxWidth * .02,
              ),
              Container(
                width: constraints.maxWidth * .4,
                child: Column(
                  children: [
                    Container(
                      width: constraints.maxWidth * .4,
                      child: Text("Huile de tournesol Casino --1.5l",
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * .02,
                    ),
                    Container(
                      width: constraints.maxWidth * .4,
                      child: Text(
                        "15 pièces",
                        style: TextStyle(
                            fontSize: constraints.maxWidth * .03,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: constraints.maxWidth * .05,
          ),
          Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Image.asset(
                "assets/images/mayonaise-p.jpg",
                height: constraints.maxHeight * .25,
                width: constraints.maxWidth * .25,
              ),
              SizedBox(
                width: constraints.maxWidth * .02,
              ),
              Container(
                width: constraints.maxWidth * .4,
                child: Column(
                  children: [
                    Container(
                      width: constraints.maxWidth * .4,
                      child: Text("Huile de tournesol Casino --1.5l",
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * .02,
                    ),
                    Container(
                      width: constraints.maxWidth * .4,
                      child: Text(
                        "15 pièces",
                        style: TextStyle(
                            fontSize: constraints.maxWidth * .03,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: constraints.maxHeight * .1,
          ),
          Container(
            width: constraints.maxWidth * .4,
            height: constraints.maxHeight * .12,
            child: Center(
              child: Text(
                'Renouveler',
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: blanc),
          )
        ],
      ),
    );
  }
}
