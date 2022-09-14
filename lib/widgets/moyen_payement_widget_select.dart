import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoyenPayementWidgetSelect extends StatefulWidget {
  final String title;
  final String asset_url;
  final bool isDefault;
  final bool isCreditOrCash;
  final String subTitle;
  final Function onTap;
  const MoyenPayementWidgetSelect(
      {Key? key,
      required this.title,
      required this.asset_url,
      this.isDefault = false,
      this.isCreditOrCash = true,
      this.subTitle = "",
      required this.onTap})
      : super(key: key);

  @override
  _MoyenPayementWidgetSelectState createState() =>
      _MoyenPayementWidgetSelectState();
}

class _MoyenPayementWidgetSelectState extends State<MoyenPayementWidgetSelect> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
          onTap: () => widget.onTap(),
          child: Center(
            child: Container(
              width: constraints.maxWidth * .9,
              height: constraints.maxHeight,
              child: Row(
                children: [
                  Container(
                    width: constraints.maxWidth * .05,
                    height: constraints.maxHeight * .27,
                    child: Center(
                      child: widget.isDefault
                          ? Container(
                              height: constraints.maxHeight * .15,
                              width: constraints.maxWidth * .027,
                              decoration: BoxDecoration(
                                  color: meuveFonce,
                                  borderRadius: BorderRadius.circular(50.0)),
                            )
                          : Container(
                              height: constraints.maxHeight * .15,
                              width: constraints.maxWidth * .027,
                            ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: gris),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                  Container(
                    width: constraints.maxWidth * .8,
                    height: constraints.maxHeight * .9,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Container(
                            width: constraints.maxWidth * .12,
                            child: Image.asset(
                              widget.asset_url,
                              fit: BoxFit.contain,
                            )),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Column(
                              children: [
                                Spacer(),
                                Container(
                                    width: constraints.maxWidth * .6,
                                    child: Text("${widget.title}")),
                                Container(
                                    width: constraints.maxWidth * .6,
                                    child: Text(
                                      "${widget.subTitle}",
                                      style: TextStyle(
                                          color: meuveFonce, fontSize: 10),
                                    )),
                                Spacer(),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: gris),
                        borderRadius: BorderRadius.circular(5.0)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
