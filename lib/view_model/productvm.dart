
import 'package:accountingsmart/model/productmodel.dart';
import 'package:accountingsmart/model/usermodel.dart';
import 'package:accountingsmart/services/ProductService.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class product_vm extends ChangeNotifier {
  List<ProductModel> listProduct = [
  // ProductModel(
  // nameProduct: 'منتج1',
  // priceProduct: '2000',
  // type: 'type',
  // expire: '2025/5/2',
  // fkuser: '1'),
  // ProductModel(
  // nameProduct: 'منتج3',
  // priceProduct: '1000',
  // type: 'type',
  // expire: '2024/1/2',
  // fkuser: '1'),
  // ProductModel(
  // nameProduct: 'منتج2',
  // priceProduct: '1200',
  // type: 'type',
  // expire: '2023/8/2',
  // fkuser: '1')
  ];
  late String? selectedValue=null;

  void changeVal(String?  val){
    selectedValue=val;
    notifyListeners();
  }
  bool isloading=false;
  UserModel? usercurrent;

  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getproduct_vm() async {

    listProduct.clear();
    print('after clear');
    print(listProduct.length);
    // notifyListeners();
    listProduct = await ProductService()
        .getAllProduct(usercurrent!.idUser.toString());
    notifyListeners();
  }

  Future<String> addproduct_vm(Map<String, dynamic?> body) async {
    isloading=true;
    notifyListeners();
    //ProductModel res = await ProductService().addProduct(body);
    // if (res!="false") {
    //   body.addAll({'id_product':res});
    //listProduct.insert(0,res);
    listProduct.insert(0, ProductModel.fromJson(body));
    //notifyListeners();
    // }
    isloading=false;
    notifyListeners();
    return "done";
  }
  Future<bool> updateproduct_vm(Map<String, dynamic?> body,String id_product) async {
    ProductModel res = await ProductService().updateProduct(body,id_product);

    final index=listProduct.indexWhere((element) => element.idProduct==id_product);
    listProduct[index]=res;
    notifyListeners();

    return true;
  }

  Future<String> deleteProduct(String? id_product) async {
    //listProduct=[];
    String res = await ProductService().deleteProductById(id_product!);
    print(res);
    if(res=="done"){
      final index=listProduct.indexWhere(
              (element) =>
          element.idProduct==id_product);
      listProduct.removeAt(index);
      notifyListeners();
    }
    return res;
  }

}









