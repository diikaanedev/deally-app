import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/get-date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuiviExpeditionWidget extends StatefulWidget {
  final OrderItemModel order;
  const SuiviExpeditionWidget({Key? key, required this.order})
      : super(key: key);

  @override
  State<SuiviExpeditionWidget> createState() => _SuiviExpeditionWidgetState();
}

class _SuiviExpeditionWidgetState extends State<SuiviExpeditionWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * .05,
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                    Container(
                      width: constraints.maxWidth * .9,
                      child: Column(
                        children: [
                          Container(
                            width: constraints.maxWidth * .9,
                            child: Text(
                              'In shipment',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .04,
                                  color: noir,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * .9,
                            child: Text(
                              'Estimated delivery time ${getFormatedDateLiv(widget.order.date)}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .03,
                                  color: noir,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                    Column(
                      children: [
                        Spacer(),
                        Container(
                          width: constraints.maxWidth * .9,
                          child: Row(
                            children: [
                              Container(
                                height: 5,
                                width: constraints.maxWidth * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: meuveFonce,
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              SizedBox(
                                  height: constraints.maxHeight * .05,
                                  width: constraints.maxHeight * .05,
                                  child: SvgPicture.asset(
                                    "assets/images/cart-flatbed-solid.svg",
                                    color: meuveFonce,
                                  )),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Container(
                                height: 5,
                                width: constraints.maxWidth * .25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: noir.withOpacity(.4),
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Container(
                                  height: constraints.maxHeight * .05,
                                  width: constraints.maxHeight * .05,
                                  child: SvgPicture.asset(
                                    "assets/images/truck-fast-solid.svg",
                                    color: noir.withOpacity(.4),
                                  )),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Container(
                                height: 5,
                                width: constraints.maxWidth * .25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: noir.withOpacity(.4),
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Container(
                                  height: constraints.maxHeight * .05,
                                  width: constraints.maxHeight * .05,
                                  child: SvgPicture.asset(
                                    "assets/images/location-dot-solid.svg",
                                    color: noir.withOpacity(.4),
                                  )),
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                            width: constraints.maxWidth * .9,
                            // color: rouge,
                            child: Row(
                              children: [
                                Text(
                                  'Picking',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .2,
                                ),
                                Text(
                                  'Dispatch',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .17,
                                ),
                                Text(
                                  'Delivered',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: SizedBox(
                width: constraints.maxWidth * .9,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: constraints.maxHeight * .07,
                            width: constraints.maxHeight * .07,
                            child: SvgPicture.asset(
                              "assets/images/cart-flatbed-solid.svg",
                              color: meuveFonce,
                            )),
                        SizedBox(
                          width: constraints.maxWidth * .03,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                height: constraints.maxHeight * .02,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .6,
                                child: Text(
                                  'Picking',
                                  style: TextStyle(
                                      color: meuveFonce,
                                      fontSize: constraints.maxHeight * .04,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(
                                height: constraints.maxHeight * .005,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .6,
                                child: Text(
                                  '${getFormatedDate(widget.order.date)}',
                                  style: TextStyle(
                                      color: meuveFonce,
                                      fontSize: constraints.maxHeight * .03,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * .02,
                    ),
                    Container(
                      height: constraints.maxHeight * .38,
                      child: Stack(
                        children: [
                          Container(
                            height: constraints.maxHeight * .4,
                            width: constraints.maxWidth,
                          ),
                          Positioned(
                              left: constraints.maxWidth * .025,
                              child: Container(
                                width: 1,
                                height: constraints.maxHeight * .3,
                                color: noir.withOpacity(.4),
                              )),
                          Positioned(
                              top: constraints.maxHeight * .1,
                              left: (constraints.maxWidth * .025) - 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: noir.withOpacity(.4)),
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .03,
                                    ),
                                    Text(
                                      'Delivery',
                                      style: TextStyle(
                                          fontSize: constraints.maxHeight * .05,
                                          color: noir.withOpacity(.4),
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                              top: constraints.maxHeight * .27,
                              left: (constraints.maxWidth * .025) - 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: noir.withOpacity(.4)),
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * .03,
                                    ),
                                    Text(
                                      'Delivered',
                                      style: TextStyle(
                                          fontSize: constraints.maxHeight * .05,
                                          color: noir.withOpacity(.4),
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
