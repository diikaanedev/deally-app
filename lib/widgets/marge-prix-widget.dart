import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MargePrixWidget extends StatefulWidget {
  final PackDiscountsModel packDiscountsModel;

  final bool isSelected;

  final Function onPress;

  const MargePrixWidget(
      {Key? key,
      required this.isSelected,
      required this.packDiscountsModel,
      required this.onPress})
      : super(key: key);

  @override
  _MargePrixWidgetState createState() => _MargePrixWidgetState();
}

class _MargePrixWidgetState extends State<MargePrixWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => widget.onPress(),
          child: Container(
            width: constraints.maxWidth * .7,
            decoration: BoxDecoration(
                border: widget.isSelected
                    ? Border.all(color: meuveFonce)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    '${widget.packDiscountsModel.price} NGN',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .1,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "From ${widget.packDiscountsModel.min} to ${widget.packDiscountsModel.max}",
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .07,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'pieces',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .07,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
