import 'package:deally_app/models/revenue.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii-fournisseur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class RevenueFournisseur extends StatefulWidget {
  const RevenueFournisseur({Key? key}) : super(key: key);

  @override
  State<RevenueFournisseur> createState() => _RevenueFournisseurState();
}

class _RevenueFournisseurState extends State<RevenueFournisseur> {
  late Size size;
  int i = 1;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * .25,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/revenu.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                            '${DateTime.now().day} Avril  -  ${DateTime.now().add(Duration(days: 7)).day} Avril   '),
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 14,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () => setState(() {
                            i == 1 ? i = 2 : i = 1;
                          }),
                          child: CircleAvatar(
                            backgroundColor: meuveClair,
                            child: Center(
                              child: Icon(
                                CupertinoIcons.chevron_back,
                                color: meuveFonce,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .1,
                        ),
                        Text(
                          i == 1 ? '25.000 naira' : '58.900 naira',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: meuveFonce,
                              fontSize: size.height * .03),
                        ),
                        SizedBox(
                          width: size.width * .1,
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            i == 1 ? i = 2 : i = 1;
                          }),
                          child: CircleAvatar(
                            backgroundColor: meuveClair,
                            child: Center(
                              child: Icon(
                                CupertinoIcons.chevron_forward,
                                color: meuveFonce,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    SizedBox(
                      height: size.height * .27,
                      width: size.width,
                      // child: charts.BarChart(
                      //   i == 1 ? seriesFirst : seriesSecond,
                      //   animate: true,
                      // ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: Container(
                        height: .2,
                        color: noir,
                        width: size.width * .9,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Number of orders of the week ',
                          style: TextStyle(
                            fontSize: size.height * .012,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Text(
                          i == 1 ? '55' : '72',
                          style: TextStyle(fontSize: size.height * .014),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: Container(
                        height: .2,
                        color: noir,
                        width: size.width * .9,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Profit of the week ',
                          style: TextStyle(
                            fontSize: size.height * .012,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Text(
                          i == 1 ? '25.000' + ' naira' : '58.900' + ' naira',
                          style: TextStyle(fontSize: size.height * .014),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width * .9,
                      child: Center(
                        child: Text(
                          'Check the details'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: size.height * .014),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: gris)),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      height: size.height * .12,
                      color: gris,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.height * .03,
                              ),
                              Text(
                                'Balance :  25.000 naira ',
                                style: TextStyle(
                                    fontSize: size.height * .016,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.height * .03,
                              ),
                              Text(
                                'Scheduled payment for ${DateTime.now().add(Duration(days: 15)).day} Avril ',
                                style: TextStyle(
                                    fontSize: size.height * .014,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .06,
                              ),
                              Container(
                                height: size.height * .04,
                                width: size.width * .3,
                                child: Center(
                                  child: Text(
                                    'COLLECT',
                                    style: TextStyle(
                                      color: blanc,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: noir.withOpacity(.8),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: size.height * .02,
                  child: Container(
                    height: size.height * .07,
                    width: size.width,
                    child: Center(
                        child: MenuBottomByDiiFournisseur(
                      choix: 2,
                    )),
                  ))
            ],
          )),
    );
  }
}
