


import 'package:accountingsmart/api/api.dart';
import 'package:accountingsmart/model/regoin_model.dart';
import 'package:accountingsmart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class regoin_vm extends ChangeNotifier{

  late List<RegoinModel> listregoin=[];
  late List<RegoinModel> listregoinfilter=[];
  late String? selectedValueLevel=null;

  void changeVal(String?  val){
    print('inside regoin vm');
    print(val);
    if(val==null||val=="null")
   {
     selectedValueLevel=null;
   print('regoin vm');
   }
    else
      {selectedValueLevel=val;print('regoin in vm');}
    notifyListeners();
  }
  late String? selectedValueuser=null;

  void changeValuser(String?  val){
    print('inside regoin vm');
    print(val);
    if(val==null||val=="null")
   {
     selectedValueuser=null;
   print('regoin vm');
   }
    else
      {selectedValueuser=val;print('regoin in vm');}
    notifyListeners();
  }
  void clearvalues() {
    listregoin=[];
    selectedValueLevel=null;
    notifyListeners();
  }
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  Future<void> getregoin()async {
    listregoinfilter=[];
    if (listregoin.isEmpty) {
      List<dynamic> data = [];
      data = await Api()
          .get(url: url +
          'country/get_regoinByIdCountry.php?fk_country=${usercurrent!
              .fkCountry}');
      print(data);
      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listregoin.add(RegoinModel.fromJson(data[i]));
        }
      }
    }
    listregoinfilter=List.from(listregoin);// [...listregoin];listregoin.tolist();
    listregoinfilter.insert(0,RegoinModel(
        id_regoin: '0', name_regoin: 'الكل', fk_country: ''));
    notifyListeners();
    //var  data=await RegoinService().getRegoinByCountry("1");
    //listregoin= data as  List<RegoinModel>;
  }
  Future<String> addRegoin_vm(Map<String, dynamic?> body) async {

    String res = await Api().post(
        url: url+'users/add_regoin.php',//users/addmangemt.php
        body: body);
    if (res!="error") {
      body.addAll({
        'id_reason':res,
      });
      listregoin.insert(0,RegoinModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }
  Future<String> update_regoin(Map<String, dynamic?> body, String idmanag) async {
    //name_mange
    String res = await Api().post(
        url: url+'users/update_regoin.php?id_regoin=${idmanag}',//users/addmangemt.php
        body: body);
    listregoin.add(RegoinModel.fromJson(body));
    notifyListeners();

    return res;
  }

}