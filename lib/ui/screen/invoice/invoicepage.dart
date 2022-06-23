import 'package:accountingsmart/model/invoicemodel.dart';
import 'package:accountingsmart/ui/screen/invoice/addinvoice.dart';
import 'package:accountingsmart/ui/widget/custom_widget/card_expansion.dart';
import 'package:accountingsmart/ui/widget/custom_widget/cardinvoice_detail.dart';
import 'package:accountingsmart/ui/widget/custom_widget/customTextStyle.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/rowedit_title.dart';
import 'package:accountingsmart/ui/widget/custom_widget/separatorLine.dart';
import 'package:accountingsmart/view_model/invoice_vm.dart';
import 'package:accountingsmart/view_model/privilge_vm.dart';
import 'package:accountingsmart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class InvoicePage extends StatefulWidget {
  InvoicePage({ Key? key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  String? regoin;
  List<InvoiceModel> list_invooice=[];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
    });
    super.initState();
  }
  @override
  void didChangeDependencies() {

    Future.delayed(Duration(milliseconds: 10)).then((_) async {

    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    list_invooice=Provider.of<invoice_vm>(context,listen: true).listinvoices;
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
              builder: (context)=>addinvoice()));
        },
        tooltip: 'إضافة فاتورة',

        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,  title:Text( 'الفواتير ',
        style:
        TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // height: 90,
          child: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: list_invooice.length,
                    itemBuilder: (BuildContext context, int index) {
                    return
                      buildcardExpansion(
                        'فاتورة مبيعات '+ list_invooice[index].dateCreate.toString(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('الزبون : '+list_invooice[index].name_customer.toString(),style: customStyle.textStyle(),),
                              SizedBox(width: 10,),
                              Text('المنطقة : '+list_invooice[index].nameregoin.toString(),style:  customStyle.textStyle(),),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
                        child: Column(
                          children: [
                            RowEditTitle(name: 'اسم المادة', des: 'الكمية',des2: 'السعر',),
                            Divider(thickness: 1,color: Colors.grey,),
                            for(int i=0;i<list_invooice[index].products!.length;i++)
                            // CardInvoiceDetailes(name: 'المادة',amount: 'الكمية',price: 'السعر',),
                            CardInvoiceDetailes(
                              name: list_invooice[index].products![i].nameProduct.toString(),
                              price: list_invooice[index].products![i].price.toString(),
                              amount: list_invooice[index].products![i].amount.toString(),),

                            MySeparator(),
                            RowEdit(name: 'الإجمالي :', des:list_invooice[index].total.toString() ),
                            RowEdit(name: 'المدفوع :', des: list_invooice[index].amount_paid.toString()),
                            RowEdit(name: 'المتبقي :',
                                des:
                                ( double.parse(list_invooice[index].total.toString())-
                                double.parse(list_invooice[index].total.toString())).toString()
                            ),
                            RowEdit(name: 'الدفع :', des: list_invooice[index].typePay=='1'?'مدفوع':'آجل'),
                            RowEdit(name: 'النوع :', des:
                            list_invooice[index].typeinvoice==''?'':'مرتجع'
                            ),
                            Divider(thickness: 1,color: Colors.grey,),
                            Divider(thickness: 1,color: Colors.grey,),
                            RowEdit(name: 'السندات', des: ''),
                            RowEditTitle(name: ' نوع السند', des2: 'تاريخ',des: 'القيمة',),
                            CardInvoiceDetailes(name: 'قبض', price: '1/2/2021', amount: '700',),
                            CardInvoiceDetailes(name: 'قبض', price: '2/5/2022', amount: '500',),
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),

              /////////////////////
              // buildcardExpansion('فاتورة مشتريات '+ '10/22/2022',
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Center(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text('المورد : '+'محمد جمال الدين ',style: customStyle.textStyle(),),
              //           SizedBox(width: 10,),
              //           Text('المنطقة : '+'بغداد ',style:  customStyle.textStyle(),),
              //         ],
              //       ),
              //     ),),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
              //     child: Column(
              //       children: [
              //         // Row(
              //         //   children: [
              //         //     Text('الزبون : '+'احمد الجاسم'),
              //         //     Text('المنطقة : '+'بغداد '),
              //         //   ],
              //         // ),
              //
              //         RowEditTitle(name: 'اسم المادة', des: 'الكمية',des2: 'السعر',),
              //         Divider(thickness: 1,color: Colors.grey,),
              //
              //         // CardInvoiceDetailes(name: 'المادة',amount: 'الكمية',price: 'السعر',),
              //         CardInvoiceDetailes(name: 'منتج1', price: '1000', amount: '2',),
              //         CardInvoiceDetailes(name: 'منتج2', price: '500', amount: '1',),
              //
              //         MySeparator(),
              //         RowEdit(name: 'الإجمالي :', des: '1500'),
              //         RowEdit(name: 'المدفوع :', des: '1500'),
              //         RowEdit(name: 'المتبقي :', des: '0'),
              //         RowEdit(name: 'الدفع :', des: 'نقدي'),
              //         RowEdit(name: 'النوع :', des: 'كامل'),
              //         Divider(thickness: 1,color: Colors.grey,),
              //         Divider(thickness: 1,color: Colors.grey,),
              //         RowEdit(name: 'السندات', des: ''),
              //         RowEditTitle(name: ' نوع السند', des2: 'تاريخ',des: 'القيمة',),
              //         CardInvoiceDetailes(name: 'دفع', price: '11/12/2022', amount: '1500',),
              //         //CardInvoiceDetailes(name: 'دفع', price: '3/7/2022', amount: '850',),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void filtershow() {
    // Provider.of<invoice_vm>(context,listen: false).
    // getfilterview(regoin,'not');

  }
}
