import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final String text;
  final bool isFilter;
  const FilterWidget({Key? key, this.text = '', this.isFilter = false})
      : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        child: widget.isFilter
            ? Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .02,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    child: Image.asset(
                      'assets/images/pare-feu.png',
                      height: 15,
                      width: 15,
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                  Text("${widget.text}")
                ],
              )
            : Center(
                child: Text('${widget.text}'),
              ),
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: widget.isFilter
              ? Border.all(color: Colors.transparent)
              : Border.all(color: gris.withOpacity(.6)),
          color: widget.isFilter ? gris.withOpacity(.6) : blanc,
        ),
      ),
    );
  }
}
