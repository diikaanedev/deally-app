import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TextFieldByDii extends StatefulWidget {
  final String label;

  const TextFieldByDii({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _TextFieldByDiiState createState() => _TextFieldByDiiState();
}

class _TextFieldByDiiState extends State<TextFieldByDii> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                top: constraints.maxHeight * .05,
                left: constraints.maxWidth * .1,
                child: Container(
                  height: constraints.maxHeight * .9,
                  width: constraints.maxWidth * .8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: gris)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: widget.label,
                        labelStyle: TextStyle(fontWeight: FontWeight.w300),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }
}
