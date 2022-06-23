import 'package:accountingsmart/ui/widget/container_boxShadows.dart';
import 'package:accountingsmart/ui/widget/custom_widget/custombutton.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/text_form.dart';
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

class addProduct extends StatefulWidget {
  addProduct({
    this.fkmain,
    required this.nameregoin,
    required this.idregoin, Key? key}) : super(key: key);
  String? idregoin,nameregoin,fkmain;

  @override
  _addProductState createState() => _addProductState();
}
class _addProductState extends State<addProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameproduct = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeproductController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override void initState() {

    nameproduct.text=widget.idregoin==null?''
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
            inAsyncCall: Provider.of<product_vm>(context)
                .isloading,
            child : Form(
              key: _globalKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 100,
                    right: 20,
                    left: 20,bottom: 20),
                child: ContainerShadows(
                  width: double.infinity,
                  margin: EdgeInsets.only(),
                  padding:EdgeInsets.only(top: 50,left: 20,right: 20) ,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),

                      RowEdit(name: 'اسم المادة', des: 'REQUIRED'),
                      SizedBox(height: 15,),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: '',
                        controller: nameproduct,
                      ),
                      RowEdit(name: ' سعر المادة', des: 'REQUIRED'),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_priceprod,
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }
                          if(double.tryParse(value.toString()) == null)
                            return 'من فضلك ادخل عدد';
                        },
                        controller: priceController,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                        inputType: TextInputType.number,
                      ),
                      SizedBox(height: 15,),
                      RowEdit(name: 'الوحدة ', des: 'REQUIRED'),
                      SizedBox(height: 15,),

                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: '',
                        controller: typeproductController,
                      ),
                      RowEdit(name: 'الصلاحية ', des: 'REQUIRED'),
                      TextFormField(
                        validator:  (value) {
                          if (_currentDate == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }},
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                              hintText:
                              _currentDate == DateTime(1, 1, 1)
                              ? 'التاريخ' //_currentDate.toString()
                              :DateFormat('yyyy-MM-dd').format(_currentDate),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context, DateTime.now());
                        },
                      ),
                      SizedBox(height: 15,),
                      CustomButton(
                        width:double.infinity,
                        //MediaQuery.of(context).size.width * 0.2,
                        text: 'حفظ',
                        onTap: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            // addproduct_vm
                           await Provider.of<product_vm>(context,listen: false)
                            .addproduct_vm({
                              'nameProduct':nameproduct.text.toString(),
                              'priceProduct':priceController.text.toString(),
                              'typeproduct':typeproductController.text.toString(),
                              'expire':Utils.toDate22(_currentDate),//DateTime.now().toString(),
                              'fkuser':Provider.of<user_vm_provider>(context,listen: false).currentUser.idUser.toString(),
                            });
                            nameproduct.text='';
                            priceController.text='';
                            typeproductController.text='';
                            _currentDate=DateTime(1,1,1);
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
    nameproduct.text="";
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
  DateTime _currentDate = DateTime(1, 1, 1);
  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);
    // DateFormat('yyyy-MM-dd – kk:mm').format(now);
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        // _invoice.dateinstall_task=pickedDate.toString() ;
        _currentDate = pickedDate;
        print(_currentDate.toString());
        //
        // final time = Duration(hours: DateTime.now().hour,
        //     minutes: DateTime.now().minute,seconds: DateTime.now().second);
        // print('timme');
        // print(DateFormat.Hms().format(_currentDate));
        // _currentDate.add(Duration(hours: DateTime.now().hour));
        // print(time.toString());
        // print(_currentDate.toString());
        // _currentDate.add(Duration(hours: selectedTime.hour));

        // _invoice!.dateinstall_task = _currentDate.toString();
        //_invoice!.daterepaly = _currentDate.toString();
        //_currentDate.hour=DateTime.now().hour;
      });

  }

}
