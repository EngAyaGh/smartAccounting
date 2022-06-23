import 'package:accountingsmart/model/customersmodel.dart';
import 'package:accountingsmart/model/invoicemodel.dart';
import 'package:accountingsmart/model/productmodel.dart';
import 'package:accountingsmart/ui/widget/container_boxShadows.dart';
import 'package:accountingsmart/ui/widget/custom_widget/cardinvoice_detail.dart';
import 'package:accountingsmart/ui/widget/custom_widget/custombutton.dart';
import 'package:accountingsmart/ui/widget/custom_widget/customformtext.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/separatorLine.dart';
import 'package:accountingsmart/ui/widget/custom_widget/text_form.dart';
import 'package:accountingsmart/view_model/invoice_vm.dart';
import 'package:accountingsmart/view_model/productvm.dart';
import 'package:accountingsmart/view_model/switch_provider.dart';
import 'package:accountingsmart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<ProductModel> listProduct = [];
  List<CustomerModel> listcustom = [];
  String? selectedvalue = null;
  String? selectedvalueCustomer = null;
  late int index = 0;

  @override
  Widget build(BuildContext context) {
    listProduct = Provider.of<product_vm>(context, listen: true).listProduct;
    var sizeMedia = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: ContainerShadows(
        width: double.infinity,
        // height: 400,
        margin: EdgeInsets.only(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeMedia * .05, vertical: sizeMedia * .05),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      DropdownButton(
                        isExpanded: true,
                        hint: Text("المادة"),
                        items: listProduct.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.nameProduct), //label of item
                            value: level_one.idProduct, //value of item
                          );
                        }).toList(),
                        value: selectedvalue, //select_dataItem!.idCountry ,
                        onChanged: (value) {
                          setState(() {
                            selectedvalue = value.toString();
                            index = listProduct.indexWhere((element) =>
                                element.idProduct == selectedvalue);
                            // calculate();
                          });
                          //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                        },
                      ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        RowEdit(name: 'الكمية', des: 'required'),
                        EditTextFormField(
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
                        RowEdit(name: 'السعر', des: 'required'),
                        EditTextFormField(
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
                          // inputformate: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
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
              const MySeparator(color: Colors.grey),
              for(
              int i=0;i<
              Provider.of<invoice_vm>(context,listen: true).listproductinvoic.length;i++)
              CardInvoiceDetailes(name:
              Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].nameProduct.toString(),
                price: Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].price.toString(),
                amount:Provider.of<invoice_vm>(context,listen: true).listproductinvoic[i].amount.toString(),),
              Row(
                children: [
                DropdownButton(
                  isExpanded: true,
                  hint: Text("الزبون"),
                  items: listcustom.map((level_one) {
                    return DropdownMenuItem(
                      child: Text(level_one.namecustom), //label of item
                      value: level_one.idcustomer, //value of item
                    );
                  }).toList(),
                  value: selectedvalueCustomer, //select_dataItem!.idCountry ,
                  onChanged: (value) {
                    setState(() {
                      selectedvalueCustomer = value.toString();
                      // calculate();
                    });
                    //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                  },
                ),
              ],),
              Row(
                children: [

                  // RowEdit(name: label_amount_paid, des: 'required'),
                  CustomFormField(
                    // obscureText: false,
                    hintText: 'الإجمالي',
                    vaild: (value) {
                      if (value.toString().trim().isEmpty) {
                        return label_empty;
                      }
                      if (double.tryParse(value.toString()) == null)
                        return 'من فضلك ادخل عدد';
                    },
                    con: totalController, //اسم المؤسسة
                    //label: label_client,
                    onChanged: (val) {
                      // nameprod = val;
                    },
                    inputType: TextInputType.number, read: true, radius: 20,
                    // inputformate: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                  ),
                  CustomFormField(
                    // obscureText: false,
                    hintText: label_amount_paid,
                    vaild: (value) {
                      if (value.toString().trim().isEmpty) {
                        return label_empty;
                      }
                      if (double.tryParse(value.toString()) == null)
                        return 'من فضلك ادخل عدد';
                    },
                    con: amount_paidController, //اسم المؤسسة
                    //label: label_client,
                    onChanged: (val) {
                      // nameprod = val;
                    },
                    inputType: TextInputType.number, read: true, radius: 20,
                    // inputformate: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                  ),
                ],
              ),
              Row(
                children: [
                  Center(
                    child: Consumer<switch_provider>(
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
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.2,
                    text: 'حفظ',
                    onTap: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        bool valtaxrate = Provider.of<switch_provider>(
                            context,
                            listen: false)
                            .isSwitched;
                        // selectedvalueCustomer
                        Provider.of<invoice_vm>(
                            context, listen: false)
                            .add_invoiceclient_vm( {
                          // "name_enterprise":widget.itemClient.nameEnterprise,
                          "name_customer":widget.itemClient.nameClient,
                          "nameUser":Provider.of<user_vm_provider>
                            (context,listen: false).currentUser.nameUser.toString(),//widget.itemClient.nameUser,
                          // "renew_year": renewController.text,
                          "type_pay": valtaxrate.toString(),
                          "date_create": DateTime.now().toString(), //formatter.format(_currentDate),
                          "type": '',
                          "amount_paid": amount_paidController.text,
                          // "image_record":imageController.text,
                          "fk_customer": selectedvalueCustomer,
                          "fk_idUser": Provider.of<user_vm_provider>(context,listen: false)
                              .currentUser.idUser,//the same user that create a client not current user
                          "total": totalController.text,
                          // "notes": noteController.text,
                          'fk_regoin':Provider.of<user_vm_provider>(context,listen: false)
                          .currentUser.fkRegoin,
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
        ),
      ),
    ));
  }

  void error() {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_errorAddProd)));
  }

  void clear(context) {
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
