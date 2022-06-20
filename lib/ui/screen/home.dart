
import 'package:accountingsmart/ui/widget/build_card.dart';
import 'package:accountingsmart/ui/widget/custom_widget/appbar.dart';
import 'package:accountingsmart/ui/widget/custom_widget/customDrawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override void initState() {
    super.initState();
    print('in home...init');
    WidgetsBinding.instance!.addPostFrameCallback((_){

      // Add Your Code here.
      //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();

    });
  }
  @override
  void didChangeDependencies() {
     Future.delayed(Duration(milliseconds: 60)).then((_) async {

    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var sizeh=MediaQuery.of(context).size.height;
     var paddval=1.0;
    paddval= sizeh/3;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        //drawerScrimColor: Colors.white,
        backgroundColor: Colors.grey[200],
        appBar: customAppbar(
          leading:    IconButton(
            icon: Icon(Icons.menu,color: kWhiteColor,),
            tooltip: 'Menu',
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: CustomDrawer(),

        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: BuildCard(),
          ),
        ),
      ),
    );
  }
}
