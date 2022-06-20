


import 'package:accountingsmart/ui/widget/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowEditTitle extends StatelessWidget {
  final String name;
  final String des;
  final String des2;
  const RowEditTitle({required this.name, required this.des,required this.des2, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: name,
          underline: TextDecoration.none,
        ),
        TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: des,
          underline: TextDecoration.none,
        ),   TextUtilis(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: des2,
          underline: TextDecoration.none,
        ),
      ],
    );
  }
}