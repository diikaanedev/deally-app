import 'package:deally_app/models/pack-discounts-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/widgets.dart';

class PackDiscountWidget extends StatefulWidget {
  final PackDiscountsModel packDiscountsModel;
  const PackDiscountWidget({Key? key, required this.packDiscountsModel})
      : super(key: key);

  @override
  State<PackDiscountWidget> createState() => _PackDiscountWidgetState();
}

class _PackDiscountWidgetState extends State<PackDiscountWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Text(
            '${widget.packDiscountsModel.price} NGN ',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: constraints.maxHeight * .17,
                color: meuveFonce),
          ),
          Text(
            'From ${widget.packDiscountsModel.min} to ${widget.packDiscountsModel.max}',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: constraints.maxHeight * .12,
                color: meuveFonce),
          ),
          Text(
            'items',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: constraints.maxHeight * .12,
                color: meuveFonce),
          )
        ],
      ),
    );
  }
}
