
import 'package:accountingsmart/ui/widget/container_boxShadows.dart';
import 'package:accountingsmart/ui/widget/custom_widget/custombutton.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/text_form.dart';
import 'package:accountingsmart/view_model/custom_vm.dart';
import 'package:accountingsmart/view_model/productvm.dart';
import 'package:accountingsmart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
import '../../constants.dart';
import '../../labeltext.dart';
import '../utils.dart';

class addCustom extends StatefulWidget {
  addCustom({
    this.fkmain,
    required this.nameregoin,
    required this.idregoin, Key? key}) : super(key: key);
  String? idregoin,nameregoin,fkmain;

  @override
  _addCustomState createState() => _addCustomState();
}
class _addCustomState extends State<addCustom> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namecustom = TextEditingController();
  final TextEditingController addresscustom = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override void initState() {

    namecustom.text=widget.idregoin==null?''
        :widget.nameregoin.toString();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:Directionality(
          textDirection: myui.TextDirection.rtl,
          child: ModalProgressHUD(
            inAsyncCall: Provider.of<customer_vm>(context,listen: true)
                .isloading,
            child : Form(
              key: _globalKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 100,
                    right: 20,
                    left: 20,bottom: 50),
                child: ContainerShadows(
                  width: double.infinity,
                  margin: EdgeInsets.only(),
                  padding:EdgeInsets.only(top: 50,left: 20,right: 20) ,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
//mobile
                      RowEdit(name: 'اسم الزبون', des: 'REQUIRED'),
                     // SizedBox(height: 15,),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: 'الزبون',
                        controller: namecustom,
                      ),
                      RowEdit(name: 'رقم الموبايل ', des: 'REQUIRED'),
                     // SizedBox(height: 15,),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: 'الموبايل',
                        controller: mobile,
                      ),
                      RowEdit(name: ' العنوان ', des: 'REQUIRED'),
                      EditTextFormField(
                        maxline: 4,
                        obscureText: false,
                        hintText: '',
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }

                        },
                        controller: addresscustom,
                        onChanged: (val) {
                          // nameprod = val;
                        },

                      ),
                      SizedBox(height: 15,),

                      SizedBox(height: 15,),
                      CustomButton(
                        width:double.infinity,
                        //MediaQuery.of(context).size.width * 0.2,
                        text: 'حفظ',
                        onTap: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            // addproduct_vm
                          await  Provider.of<customer_vm>(context,listen: false)
                                .addcustom_vm({
                              'namecustom':namecustom.text.toString(),
                              'addresscustom':addresscustom.text.toString(),
                              'mobile':mobile.text.toString(),
                              'typecustom':'cust',
                              'fkuser':Provider.of<user_vm_provider>(context,listen: false).currentUser.idUser.toString(),
                            });
                           namecustom.text='';
                            addresscustom.text='';
                            mobile.text='';

                            _scaffoldKey.currentState!.showSnackBar(
                                SnackBar(content: Text(' تم الحفظ بنجاح  '))
                            );
                            // if(widget.idregoin==null){
                            //   Provider.of<maincity_vm>(context,listen: false)
                            //       .addcity_vm({
                            //     'name_city':namelevel.text,
                            //     'fk_maincity': widget.fkmain,
                            //   }).then(
                            //           (value) =>  value!="error"
                            //           ? clear(context)
                            //           : error(context)
                            //   );}
                            // else{
                            //   Provider.of<maincity_vm>(context,listen: false)
                            //       .update_city({
                            //     'name_city':namelevel.text,
                            //     'fk_maincity':widget.fkmain,
                            //     'id_city':widget.idregoin,
                            //   },widget.idregoin.toString()).then(
                            //           (value) =>  value!="error"
                            //           ? clear(context)
                            //           : error(context)
                            //   );
                            // }
                          }else {
                            _scaffoldKey.currentState!.showSnackBar(
                                SnackBar(content: Text('الحقل فارغ  '))
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
  clear(BuildContext context) {
    namecustom.text="";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('تمت الإضافة بنجاح'))
    );
    Navigator.pop(context);
    // print("succ");
  }

  error(context) {

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }


}
