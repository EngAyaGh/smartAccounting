
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class customAppbar extends StatelessWidget implements PreferredSizeWidget{
   customAppbar({this.leading, Key? key}) : super(key: key);
   Widget? leading;
  @override
  Widget build(BuildContext context) {
     print('build appbar');
    return  AppBar(
      key: key,
      leading:leading,

      title: Text('تطبيق محاسبة',style: TextStyle(color: kWhiteColor,fontFamily: kfontfamily2),),
      centerTitle: true,
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(50);
}
