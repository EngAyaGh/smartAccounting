import 'package:accountingsmart/model/customersmodel.dart';
import 'package:accountingsmart/model/invoicemodel.dart';
import 'package:accountingsmart/model/productmodel.dart';
import 'package:accountingsmart/ui/utils.dart';
import 'package:accountingsmart/ui/widget/container_boxShadows.dart';
import 'package:accountingsmart/ui/widget/custom_widget/cardinvoice_detail.dart';
import 'package:accountingsmart/ui/widget/custom_widget/custombutton.dart';
import 'package:accountingsmart/ui/widget/custom_widget/customformtext.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/separatorLine.dart';
import 'package:accountingsmart/ui/widget/custom_widget/text_form.dart';
import 'package:accountingsmart/view_model/custom_vm.dart';
import 'package:accountingsmart/view_model/invoice_vm.dart';
import 'package:accountingsmart/view_model/productvm.dart';
import 'package:accountingsmart/view_model/switch_provider.dart';
import 'package:accountingsmart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class addinvoice extends StatefulWidget {
  const addinvoice({Key? key}) : super(key: key);

  @override
  _addinvoiceState createState() => _addinvoiceState();
}

class _addinvoiceState extends State<addinvoice> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController amount_paidController = TextEditingController();
  final TextEditingController QuantityController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController total_paidController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double price = 0;
  final _globalKey = GlobalKey<FormState>();
  final _globalKey2 = GlobalKey<FormState>();
  List<ProductModel> listProduct = [];
  List<CustomerModel> listcustom = [];
  String? selectedvalue = null;
  String? selectedvalueCustomer = null;
  String? selectedvalueCustomername = null;
  late int index = 0;
  double redus=10;
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      Provider.of<invoice_vm>(context,listen: false).clear();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listProduct = Provider.of<product_vm>(context, listen: true).listProduct;
    listcustom = Provider.of<customer_vm>(context, listen: true).listofcustom;
    print(listProduct.length);
    var sizeMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<invoice_vm>(context)
              .isloading,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 100,
                  right: 20,
                  left: 20,bottom: 20),
              child: ContainerShadows(
                width: double.infinity,
                // height: 400,
                margin: EdgeInsets.only(),
                child: Padding(

                  padding: EdgeInsets.symmetric(
                      horizontal: sizeMedia * .05, vertical: sizeMedia * .07),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                      children: [
                      Form(
                         key: _globalKey,
                         child: Column(
                           children: [
                             SizedBox(height: 30,),
                             Row(
                               children: [
                                 Expanded(
                                   child: Consumer<product_vm>(
                                       builder: (context, cart, child){
                                         return DropdownButton(
                                          // isExpanded: true,
                                           hint: Text("المادة"),
                                           items: cart.listProduct.map((level_one) {
                                             return DropdownMenuItem(
                                               child: Text(level_one.nameProduct), //label of item
                                               value: level_one.idProduct, //value of item
                                             );
                                           }).toList(),
                                           value: cart.selectedValue, //select_dataItem!.idCountry ,
                                           onChanged: (value) {
                                             // setState(() {
                                             selectedvalue = value.toString();
                                             cart.changeVal(value.toString());
                                             index = listProduct.indexWhere((element) =>
                                             element.idProduct == selectedvalue);
                                             // calculate();
                                             // });
                                             //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                                           },
                                         );}
                                   ),
                                 ),
                               ],
                             ),
                             Row(
                               children: [

                                 Flexible(
                                   child: Column(
                                     children: [
                                       RowEdit(name: 'السعر', des: ''),
                                       EditTextFormField(
                                         obscureText: false,
                                         hintText: 'السعر',
                                         vaild: (value) {
                                           if (value.toString().trim().isEmpty) {
                                             return label_empty;
                                           }
                                           if (double.tryParse(value.toString()) == null)
                                             return 'من فضلك ادخل عدد';
                                         },
                                         controller: priceController, //اسم المؤسسة
                                         //label: label_client,
                                         onChanged: (val) {
                                           // nameprod = val;
                                         },
                                         inputType: TextInputType.number,
                                         // inputformate: <TextInputFormatter>[
                                         //   FilteringTextInputFormatter.digitsOnly
                                         // ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 Flexible(
                                   child: Column(
                                     children: [
                                       RowEdit(name: 'الكمية', des: ''),
                                       EditTextFormField(
                                         obscureText: false,
                                         hintText: 'الكمية',
                                         vaild: (value) {
                                           if (value.toString().trim().isEmpty) {
                                             return label_empty;
                                           }
                                           if (double.tryParse(value.toString()) == null)
                                             return 'من فضلك ادخل عدد';
                                         },
                                         controller: QuantityController, //اسم المؤسسة
                                         //label: label_client,
                                         onChanged: (val) {
                                           // nameprod = val;
                                         },
                                         inputType: TextInputType.number,
                                         // inputformate: <TextInputFormatter>[
                                         //   FilteringTextInputFormatter.digitsOnly
                                         // ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     RowEdit(name: '', des: ''),
                                     CustomButton(
                                       width: MediaQuery.of(context).size.width * 0.2,
                                       text: '+',
                                       onTap: () async {
                                         if (_globalKey.currentState!.validate()) {
                                           _globalKey.currentState!.save();
                                           bool valtaxrate = Provider.of<switch_provider>(
                                               context,
                                               listen: false)
                                               .isSwitched;
                                           final index=listProduct.indexWhere(
                                                   (element) => element.idProduct==selectedvalue);
                                           ProductModel pm=listProduct[index];
                                           ProductsInvoice  pp=ProductsInvoice(
                                               idInvoiceProduct: "null",
                                               fkIdInvoice: '',
                                               price: priceController.text,
                                               nameProduct: pm.nameProduct,
                                               // widget.invoice!.idInvoice==null
                                               // ? '0' :  widget.invoice!.idInvoice.toString(),
                                               //fkcus:'',// ,
                                               fkuser:Provider.of<user_vm_provider>(context
                                                   ,listen: false).currentUser.idUser.toString(),
                                               amount: QuantityController.text,
                                               fkProduct:pm.idProduct
                                           );
                                           Provider.of<invoice_vm>(context,listen: false)
                                               .addlistproductinvoic(pp);
                                           // Provider.of<product_vm>(context, listen: false)
                                           //     .addproduct_vm({
                                           //   'fk_Product': 'nameprod',
                                           //   'priceProduct': price.toString(),
                                           //   'type': valtaxrate.toString(),
                                           //   'fk_user': Provider.of<user_vm_provider>(context,
                                           //           listen: false)
                                           //       .currentUser
                                           //       .idUser
                                           //       .toString(),
                                           //   'fk_customer': ''
                                           // }).then((value) => value != "false"
                                           //             ? clear(context)
                                           //             : error()
                                           //          );
                                         }
                                       },
                                     )
                                   ],
                                 )
                               ],
                             ),
                             SizedBox(height: 10,),
                             const MySeparator(color: Colors.grey),
                             SizedBox(height: 10,),
                             for(
                             int i=0;i<
                                 Provider.of<invoice_vm>(context,listen: true).listproductinvoic.length;i++)
                               CardInvoiceDetailes(name:
                               Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].nameProduct.toString(),
                                 price: Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].price.toString(),
                                 amount:Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].amount.toString(),),

                           ],
                         ),
                       ),
                       Form(
                          key: _globalKey2,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Consumer<customer_vm>(
                                      builder: (context, cart, child){
                                        return DropdownButton(
                                          isExpanded: true,
                                          hint: Text("اختر زبون "),
                                          items: cart.listofcustom.map((level_one) {
                                            return DropdownMenuItem(
                                              child: Text(level_one.namecustom), //label of item
                                              value: level_one.idcustomer, //value of item
                                            );
                                          }).toList(),
                                          value:cart.selectedValueLevel,
                                          onChanged:(value) {
                                            selectedvalueCustomer=value.toString();
                                            //  setState(() {
                                            cart.changeVal(value.toString());
                                            // });
                                          },
                                        );},
                                    ),
                                  ),
                                ],),
                              Row(
                                children: [
                                  // RowEdit(name: label_amount_paid, des: 'required'),
                                  Flexible(
                                    child: EditTextFormField(
                                      obscureText: false,
                                      hintText: 'الإجمالي',
                                      vaild: (value) {
                                        if (value.toString().trim().isEmpty) {
                                          return label_empty;
                                        }
                                        if (double.tryParse(value.toString()) == null)
                                          return 'من فضلك ادخل عدد';
                                      },
                                      controller: totalController, //اسم المؤسسة
                                      //label: label_client,
                                      onChanged: (val) {
                                        // nameprod = val;
                                      },
                                      inputType: TextInputType.number,
                                      //read: false, //radius: 20,
                                      // inputformate: <TextInputFormatter>[
                                      //   FilteringTextInputFormatter.digitsOnly
                                      // ],
                                    ),
                                  ),
                                  Flexible(
                                    child: EditTextFormField(
                                      obscureText: false,
                                      hintText: label_amount_paid,
                                      vaild: (value) {
                                        if (value.toString().trim().isEmpty) {
                                          return label_empty;
                                        }
                                        if (double.tryParse(value.toString()) == null)
                                          return 'من فضلك ادخل عدد';
                                      },
                                      controller: amount_paidController, //اسم المؤسسة
                                      //label: label_client,
                                      onChanged: (val) {
                                        // nameprod = val;
                                      },
                                      inputType: TextInputType.number,
                                      //read: false, //radius: redus,
                                      // inputformate: <TextInputFormatter>[
                                      //   FilteringTextInputFormatter.digitsOnly
                                      // ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Consumer<switch_provider>(
                                    builder: (context, isSwitched, child) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Cash'),
                                          Switch(
                                              activeTrackColor: kMainColor.withAlpha(90),
                                              activeColor: kMainColor,
                                              value: isSwitched.isSwitched,
                                              onChanged: (value) {
                                                //valtaxrate = value;
                                                isSwitched.changeboolValue(value);
                                              }),
                                        ],
                                      );
                                    },
                                  ),

                                  CustomButton(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    text: 'حفظ',
                                    onTap: () async {
                                      if (_globalKey2.currentState!.validate()) {
                                        _globalKey2.currentState!.save();
                                        List<ProductsInvoice>? _products=[];
                                        // _products= _invoice!.products;
                                        _products=Provider.of<invoice_vm>(context,listen: false)
                                            .listproductinvoic;
                                        bool valtaxrate = Provider.of<switch_provider>(
                                            context,
                                            listen: false)
                                            .isSwitched;
                                        String?  custname=
                                        selectedvalueCustomer==null?"":
                                        Provider.of<customer_vm>(context, listen: false)
                                            .listofcustom.firstWhere((element)
                                        => element.idcustomer==selectedvalueCustomer)
                                            .namecustom;
                                        // selectedvalueCustomer
                                        Provider.of<invoice_vm>(
                                            context, listen: false)
                                            .add_invoiceclient_vm( {
                                          // "name_enterprise":widget.itemClient.nameEnterprise,
                                          "name_customer":custname,
                                          "nameUser":Provider.of<user_vm_provider>
                                            (context,listen: false).currentUser.nameUser.toString(),//widget.itemClient.nameUser,
                                          // "renew_year": renewController.text,
                                          "typePay": valtaxrate.toString(),
                                          "dateCreate":Utils.toDate22(DateTime.now()), //formatter.format(_currentDate),
                                          "typeinvoice": '',
                                          "amount_paid": amount_paidController.text,
                                          // "image_record":imageController.text,
                                          "fk_customer": selectedvalueCustomer,
                                          "fk_idUser": Provider.of<user_vm_provider>(context,listen: false)
                                              .currentUser.idUser,//the same user that create a client not current user
                                          "total": totalController.text,
                                          // "notes": noteController.text,
                                          'fk_regoin':Provider.of<user_vm_provider>(context,listen: false)
                                              .currentUser.fkRegoin,
                                          'nameregoin':'بغداد',
                                          // 'products':_products,
                                          //'date_lastuserupdate':DateTime.now().toString(),
                                          //"date_changetype":,
                                          //'message':"",
                                        },
                                        ).then((value) =>
                                        value != "false"
                                            ? clear(context,value,_products)
                                            : error(context)
                                        );
                                      }
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                        ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void error(context) {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_errorAddProd)));
  }

  void clear(BuildContext context,
      String value,List<ProductsInvoice>? _products) async {
     Provider.of<invoice_vm>(context,listen: false).listinvoices[0].products=_products;
    Provider.of<switch_provider>(context, listen: false).changeboolValue(false);
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_doneAddProduct)));

    Navigator.pop(context);
    // Fluttertoast.showToast(
    //   backgroundColor: Colors.lightBlueAccent,
    //
    //   msg: label_doneAddProduct, // message
    //   toastLength: Toast.LENGTH_SHORT, // length
    //   gravity: ToastGravity.BOTTOM_LEFT, //
    // );
  }
}
