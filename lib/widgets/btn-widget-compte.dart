import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class BtnWidgetCompte extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color bgColor;
  const BtnWidgetCompte(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => onTap(),
        child: Container(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: constraints.maxHeight * .3,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(),
              Icon(
                CupertinoIcons.chevron_forward,
                color: meuveFonce,
              ),
              SizedBox(
                width: constraints.maxWidth * .02,
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: bgColor),
        ),
      ),
    );
  }
}
