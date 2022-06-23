



import 'package:accountingsmart/model/invoicemodel.dart';
import 'package:flutter/cupertino.dart';

class invoice_vm extends ChangeNotifier {
  List<ProductsInvoice> listproductinvoic = [];
  List<InvoiceModel> listinvoices=[];
  bool isloading=false;

  void addlistproductinvoic(value){

    listproductinvoic.add(value);
    notifyListeners();
  }
  void removelistproductinvoic(index){
    listproductinvoic.removeAt(index);
    notifyListeners();
  }

  Future<String> add_invoiceclient_vm(
      Map<String, dynamic?> body) async {

    String res='done';
    InvoiceModel data = await Invoice_Service().addInvoice(body);
    //  if(data !=null){
    print('resssssssssssssss');
    listinvoices.insert(0,data);
    res=data.idInvoice.toString();
    print(res);
    // } else res='false';
    notifyListeners();
    return res;
  }
}