import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CardInvoiceDetailes extends StatelessWidget {
   CardInvoiceDetailes({
    required this.name,required this.price,required this.amount,
    Key? key}) : super(key: key);
  String name,price,amount;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(

          children: [
            //Expanded flex 1
            Text(name,
              style: TextStyle(fontFamily: kfontfamily2),),
            Spacer(),
            Text( amount,style: TextStyle(fontFamily: kfontfamily2),),
            Spacer(),
            Text( price,style: TextStyle(fontFamily: kfontfamily2),),
          ],
        ),
        Divider(thickness: 1,color: Colors.grey,),
      ],
    );
  }
}
