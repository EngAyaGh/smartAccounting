
import 'package:accountingsmart/api/api.dart';
import 'package:accountingsmart/model/customersmodel.dart';
import 'package:accountingsmart/model/levelmodel.dart';
import 'package:accountingsmart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class customer_vm extends ChangeNotifier{

  late List<CustomerModel> listofcustom=[];
  UserModel? usercurrent;
  bool isloading=false;
  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }
  late String? selectedValueLevel=null;

  void changeVal(String?  val){
    selectedValueLevel=val;
    notifyListeners();
  }
  void clearvalues(){
    listofcustom=[];
    selectedValueLevel=null;
    notifyListeners();

  }

  Future<void> getlevel()async {
    //listoflevel=[];
    if(listofcustom.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+ 'config/getLevel.php');
      print(data);
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listofcustom.add(CustomerModel.fromJson(data[i]));
        }}
      notifyListeners();
    }}
  Future<void> addcustom_vm(Map<String, dynamic?> body) async {
    isloading=true;
    notifyListeners();
    // String res = await Api().post(
    //     url: url+'privilge/privAdd.php',
    //     body: body);
    // if (res!="error") {
    //   body.addAll({
    //     'id_level':res,
    //   });
      //listoflevel=[];
      listofcustom.add(CustomerModel.fromJson(body));
      isloading=false;
      notifyListeners();
    }
    //return res;


}