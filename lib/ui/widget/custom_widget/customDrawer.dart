
import 'package:accountingsmart/ui/screen/user/userview.dart';
import 'package:accountingsmart/view_model/user_vm_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';

import '../../../constants.dart';
import '../../login.dart';
class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  //final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
   var controllerUsers= Provider.of<user_vm_provider>(context,listen: true);

return  Drawer(
  child: Container(
    color: Colors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color:Colors.white24 //Color(0xFF56ccf2),
          ),
               accountName:
                   Text(controllerUsers.currentUser.nameUser.toString(),
                     style: TextStyle(
                         fontFamily: kfontfamily2),
                   ),

                   accountEmail:
                   Text(controllerUsers.currentUser.email.toString(),
                 style: TextStyle(
                     fontFamily: kfontfamily2),
               ),
          currentAccountPicture:
          CircleAvatar(
            backgroundColor:
            Theme.of(context).platform == TargetPlatform.iOS
                ? Color(0xFF56ccf2)
                : Colors.grey,
            child:  Provider.of<user_vm_provider>(context,listen: true)
                .currentUser.img_image!.isNotEmpty
                ?
            ClipRRect(
              borderRadius: BorderRadius.circular(45),

              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl:
                Provider.of<user_vm_provider>(context,listen: true)
                    .currentUser.img_image!    ),
            )
            // Image.network(Provider.of<user_vm_provider>(context,listen: true)
            //     .currentUser!.img_image! ,
              //width: 200,height: 200,fit: BoxFit.fill,

            // FileImage(
            //     File(Provider.of<user_vm_provider>(context,listen: true).currentUser!.img_image!))
            //     as ImageProvider
                :Text(Provider.of<user_vm_provider>(context,listen: true)
                .currentUser.nameUser
                .toString()
                .substring(0, 1))),
            // Provider.of<user_vm_provider>(context,listen: false).currentUser!.img_image!.isNotEmpty
            //     ?
            //FileImage(
               // File(Provider.of<user_vm_provider>(context,listen: false).currentUser!.img_image!)
            //)
            //as ImageProvider
            //     :
            // Text("AG",
            //   style: TextStyle(
            //     fontSize: 50,
            //     color: Colors.amber,),),
        //  ),
        ),
               // ListTile(
               //   title: Text(' الدولة',  style: TextStyle(
               //       fontFamily: kfontfamily2),
               // ),
               //   leading: Icon(Icons.location_city_rounded,color: kMainColor,),
               //   onTap: (){
               //     Navigator.push(
               //       context,
               //       MaterialPageRoute<void>(
               //         builder: (BuildContext context)
               //         => select_country(),
               //         fullscreenDialog: true,
               //       ),
               //     );
               //   },
               // ),

               ListTile(
                 title: Text('الملف الشخصي',  style: TextStyle(
                     fontFamily: kfontfamily2),
                 ),
                 leading: Icon(Icons.account_box,color: kMainColor,),
                 onTap: () {
                   // Navigator.push(
                   //   context,
                   //   MaterialPageRoute<void>(
                   //     builder: (BuildContext context)
                   //     => UserScreen(
                   //       ismyprofile: 'yes',
                   //         userModel: Provider.of<user_vm_provider>
                   //           (context,listen: false).currentUser
                   //       //index: index,
                   //     )
                   //   ),
                   // );
                   // ProductView();
                 },
               ),
               ListTile(
                 title: Text('تسجيل دخول',  style: TextStyle(
                     fontFamily: kfontfamily2),
                 ),
                 leading: Icon(Icons.exit_to_app,color: kMainColor,),
                 onTap: () async {
                   Navigator.push(
                     context,
                     MaterialPageRoute<void>(
                       builder: (BuildContext context)
                       => login()
                     ),
                   );
                   // preferences.setBool(kKeepMeLoggedIn, false);
                 },
               )
        ,ListTile(
                 title: Text('تسجيل خروج',  style: TextStyle(
                     fontFamily: kfontfamily2),
                 ),
                 leading: Icon(Icons.exit_to_app,color: kMainColor,),
                 onTap: () async {
                   // SharedPreferences preferences =
                   //     await SharedPreferences.getInstance();
                   // preferences.clear();
                   // Navigator.pushAndRemoveUntil(context,
                   //     MaterialPageRoute(builder: (context) =>
                   //         login()),
                   //       (route) => false
                   // );
                   // preferences.setBool(kKeepMeLoggedIn, false);
                 },
               )
      ],
    ),
  ),
);
  }
}
