import 'package:accountingsmart/ui/widget/custom_widget/card_expansion.dart';
import 'package:accountingsmart/ui/widget/custom_widget/cardinvoice_detail.dart';
import 'package:accountingsmart/ui/widget/custom_widget/customTextStyle.dart';
import 'package:accountingsmart/ui/widget/custom_widget/row_edit.dart';
import 'package:accountingsmart/ui/widget/custom_widget/rowedit_title.dart';
import 'package:accountingsmart/ui/widget/custom_widget/separatorLine.dart';
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:Text( 'الفواتير ',
        style:
        TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildcardExpansion('فاتورة مبيعات '+ '10/22/2022',
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الزبون : '+'احمد الجاسم',style: customStyle.textStyle(),),
                        SizedBox(width: 10,),
                        Text('المنطقة : '+'بغداد ',style:  customStyle.textStyle(),),
                      ],
                    ),
                  ),),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
                  child: Column(
                    children: [
                      RowEditTitle(name: 'اسم المادة', des: 'الكمية',des2: 'السعر',),
                      Divider(thickness: 1,color: Colors.grey,),

                      // CardInvoiceDetailes(name: 'المادة',amount: 'الكمية',price: 'السعر',),
                      CardInvoiceDetailes(name: 'منتج1', price: '1200', amount: '2',),
                      CardInvoiceDetailes(name: 'منتج2', price: '900', amount: '1',),
                      CardInvoiceDetailes(name: 'منتج4', price: '600', amount: '3',),
                      MySeparator(),
                      RowEdit(name: 'الإجمالي :', des: '2700'),
                      RowEdit(name: 'المدفوع :', des: '1200'),
                      RowEdit(name: 'المتبقي :', des: '1500'),
                      RowEdit(name: 'الدفع :', des: 'آجل'),
                      RowEdit(name: 'النوع :', des: 'كامل'),
                      Divider(thickness: 1,color: Colors.grey,),
                      Divider(thickness: 1,color: Colors.grey,),
                      RowEdit(name: 'السندات', des: ''),
                      RowEditTitle(name: ' نوع السند', des2: 'تاريخ',des: 'القيمة',),
                      CardInvoiceDetailes(name: 'قبض', price: '1/2/2021', amount: '700',),
                      CardInvoiceDetailes(name: 'قبض', price: '2/5/2022', amount: '500',),
                    ],
                  ),
                ),
              ),
              /////////////////////
              buildcardExpansion('فاتورة مشتريات '+ '10/22/2022',
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('المورد : '+'محمد جمال الدين ',style: customStyle.textStyle(),),
                        SizedBox(width: 10,),
                        Text('المنطقة : '+'بغداد ',style:  customStyle.textStyle(),),
                      ],
                    ),
                  ),),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     Text('الزبون : '+'احمد الجاسم'),
                      //     Text('المنطقة : '+'بغداد '),
                      //   ],
                      // ),

                      RowEditTitle(name: 'اسم المادة', des: 'الكمية',des2: 'السعر',),
                      Divider(thickness: 1,color: Colors.grey,),

                      // CardInvoiceDetailes(name: 'المادة',amount: 'الكمية',price: 'السعر',),
                      CardInvoiceDetailes(name: 'منتج1', price: '1000', amount: '2',),
                      CardInvoiceDetailes(name: 'منتج2', price: '500', amount: '1',),

                      MySeparator(),
                      RowEdit(name: 'الإجمالي :', des: '1500'),
                      RowEdit(name: 'المدفوع :', des: '1500'),
                      RowEdit(name: 'المتبقي :', des: '0'),
                      RowEdit(name: 'الدفع :', des: 'نقدي'),
                      RowEdit(name: 'النوع :', des: 'كامل'),
                      Divider(thickness: 1,color: Colors.grey,),
                      Divider(thickness: 1,color: Colors.grey,),
                      RowEdit(name: 'السندات', des: ''),
                      RowEditTitle(name: ' نوع السند', des2: 'تاريخ',des: 'القيمة',),
                      CardInvoiceDetailes(name: 'دفع', price: '11/12/2022', amount: '1500',),
                      //CardInvoiceDetailes(name: 'دفع', price: '3/7/2022', amount: '850',),
                    ],
                  ),
                ),
              ),
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
