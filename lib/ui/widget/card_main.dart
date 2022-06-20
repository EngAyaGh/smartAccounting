

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Card_Main extends StatelessWidget {
  const Card_Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black87.withOpacity(0.2),
            ),
          ],
          color:  Colors.white30,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //         ProfileClient(
              //             idclient:
              //             clientModel.idClients.toString())
              //     ));
            },
            child: Container(
              decoration: BoxDecoration(

                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                         '18/2/2022',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: kfontfamily2,color: kMainColor),),

                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kfontfamily2),),
                          ),
                        ]),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
