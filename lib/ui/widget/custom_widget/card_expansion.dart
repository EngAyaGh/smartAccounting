

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

Widget buildcardExpansion( String title,Widget? subtitle, Widget items) {
  return Card(
    child: ExpansionTile(
      leading: IconButton(icon:Icon(Icons.share) ,onPressed: (){},),
      // Row(
      //   children: [
      //     ButtonBar(
      //       children: <Widget>[
      //         new IconButton(
      //           icon: Icon(Icons.edit),
      //           onPressed: () {
      //             //
      //             // Navigator.push(context,
      //             //     MaterialPageRoute(
      //             //         builder: (context)=>
      //             //             editclient(
      //             //               itemClient:itemClient,
      //             //               fkclient:  itemClient.idClients.toString(),
      //             //               fkuser:    itemClient.fkUser.toString(),
      //             //             )
      //
      //               //  ));
      //           },
      //           //onPressed: REFRESH,
      //         ),
      //     new IconButton(
      //     icon: Icon(Icons.share),
      //          onPressed: () {
      //          }),
      //       ],
      //     ),
      //   ],
      // ),
       subtitle: Center(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: subtitle,
         ),
       ),
      collapsedIconColor: kMainColor,
      textColor: kMainColor,
      iconColor: kMainColor,
      // collapsedBackgroundColor: kMainColor,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
              color: kMainColor,
              fontSize: 13.0,
              fontFamily: kfontfamily2,
              fontWeight: FontWeight.bold),
        ),
      ),
      children: <Widget>[
        items
        // ListTile(
        //   title: Text(
        //     items.description,
        //     style: TextStyle(fontWeight: FontWeight.w700),
        //   ),
        // )
      ],
    ),
  );
}