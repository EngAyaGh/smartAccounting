



import 'package:accountingsmart/model/invoicemodel.dart';
import 'package:accountingsmart/model/usermodel.dart';
import 'package:accountingsmart/services/Invoice_Service.dart';
import 'package:flutter/cupertino.dart';

class invoice_vm extends ChangeNotifier {
  List<ProductsInvoice> listproductinvoic = [];
  List<InvoiceModel> listinvoices=[];
  bool isloading=false;
  UserModel? usercurrent;

  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }

  void clear(){
    listproductinvoic=[];
    // listinvoices=[];
    notifyListeners();
  }
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
    isloading=true;
    notifyListeners();
    String res='done';
    //InvoiceModel data = await Invoice_Service().addInvoice(body);
    listinvoices.insert(0, InvoiceModel.fromJson(body));
    print('resssssssssssssss');
    //listinvoices.insert(0,data);
    //res=data.idInvoice.toString();
    isloading=false;
    notifyListeners();
    return res;
  }
}