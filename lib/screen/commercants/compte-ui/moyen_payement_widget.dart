import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoyenPayementWidget extends StatefulWidget {
  final String asseturl;
  final String title;
  final String subTitle;
  const MoyenPayementWidget(
      {Key? key,
      required this.asseturl,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  _MoyenPayementWidgetState createState() => _MoyenPayementWidgetState();
}

class _MoyenPayementWidgetState extends State<MoyenPayementWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .1,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                      Icon(
                        CupertinoIcons.money_dollar,
                        size: constraints.maxHeight * .2,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                      Text(
                        'Means of payment ',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: noir,
                            fontSize: constraints.maxHeight * .15),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.chevron_right,
                        size: constraints.maxHeight * .25,
                        color: meuveFonce,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .02,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                    width: constraints.maxWidth,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        SizedBox(
                            width: constraints.maxWidth * .15,
                            child: Image.asset(widget.asseturl)),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Column(
                          children: [
                            Spacer(),
                            Container(
                                width: constraints.maxWidth * .7,
                                child: Text(
                                  "${widget.title}",
                                  style: TextStyle(color: noir, fontSize: 12),
                                )),
                            Container(
                                width: constraints.maxWidth * .7,
                                child: Text(
                                  "${widget.subTitle}",
                                  style: TextStyle(
                                      color: meuveFonce, fontSize: 10),
                                )),
                            Spacer(),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
