import 'package:accountingsmart/ui/screen/addproduct.dart';
import 'package:accountingsmart/ui/screen/customeradd.dart';
import 'package:accountingsmart/ui/screen/invoice/invoicepage.dart';
import 'package:accountingsmart/ui/screen/user/alluser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../labeltext.dart';

class BuildCard extends StatelessWidget {
  BuildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child:
                // GridView.builder(
                //     itemCount: 4,
                //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //       childAspectRatio: 0.9,
                //       mainAxisExtent: 170,
                //       crossAxisSpacing: 10.0,
                //       mainAxisSpacing: 10.0,
                //       maxCrossAxisExtent: 250,
                //     ),
                //     itemBuilder: (context, index) {
                //       return buildCardCategory(
                //           image:Icon(Icons.filter), //imageList[index],
                //           item: itemCategory[index],
                //           ontap: () =>
                //              Navigator.push(context,
                //                  MaterialPageRoute(
                //                      builder: (context)=>
                //                      listwidget[index]
                //              ))
                //       );},),
                Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCardCategory(
                      image: Icon(
                        Icons.supervised_user_circle,
                        color: kMainColor,
                      ),
                      item: 'الزبائن',
                      ontap: () {
                        //addCustom
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addCustom(
                                idregoin: null,
                                nameregoin: null,
                                fkmain: null,
                              ),
                            ));
                      },
                      context: context),
                  buildCardCategory(
                      image: Icon(
                        Icons.supervised_user_circle,
                        color: kMainColor,
                      ),
                      item: 'الموردين',
                      ontap: () {},
                      context: context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCardCategory(
                      image: Icon(
                        Icons.shop,
                        color: kMainColor,
                      ),
                      item: 'المواد',
                      ontap: () {
                        //addProduct
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addProduct(
                                idregoin: null,
                                nameregoin: null,
                                fkmain: null,
                              ),
                            ));
                      },
                      context: context),
                  buildCardCategory(
                      image: Icon(
                        Icons.insert_chart,
                        color: kMainColor,
                      ),
                      item: 'التقارير',
                      ontap: () {
                        //addProduct

                      },
                      context: context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCardCategory(
                    image: Icon(
                      Icons.description_outlined,
                      color: kMainColor,
                    ),
                    item: 'الفواتير',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoicePage(),
                          ));
                    },
                    context: context,
                  ),
                  buildCardCategory(
                      image: Icon(
                        Icons.perm_contact_cal,
                        color: kMainColor,
                      ),
                      item: 'المستخدمين',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllUserScreen(),
                            ));
                      },
                      context: context),
                ],
              ),
            ],
          ),
        )));
  }

  Widget buildCardCategory({
    required BuildContext context,
    required Icon image,
    required String item,
    required Function() ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                stops: [0.05, 0.02], colors: [kMainColor, Colors.white]),
            // border:Border(
            //   left: BorderSide( //                   <--- left side
            //     color: Colors.black,
            //     width: 3.0,
            //   ),
            //   top: BorderSide( //                    <--- top side
            //     color: Colors.black,
            //     width: 3.0,
            //   ),
            // ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image(image: AssetImage('assest/images/bill.png')),

                SizedBox(
                  height: 15,
                  child:
                      //Image.asset(
                      image,
                  // color: Colors.amber,
                  // ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: kfontfamily3,
                      color: Colors.black),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
