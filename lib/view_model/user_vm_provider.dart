


import 'package:accountingsmart/model/usermodel.dart';
import 'package:accountingsmart/services/UserService.dart';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
class user_vm_provider extends ChangeNotifier{

  List<UserModel> userall=[];
  List<UserModel> listuserfilter=[

    UserModel(
        nameUser: "aya",fkCountry: "1",mobile: '',path: '',img_image: '',nameRegoin: 'بغداد',name_level: 'admin',name_mange: 'admin',
        fkRegoin: "1",idUser: "1",email: "aya.ghoury@gmail.com", nameuserAdd: '', created_at: '', isActive: '1', fkuserAdd: ''),
    UserModel(
        nameUser: "نور",fkCountry: "1",mobile: '',path: '',img_image: '',nameRegoin: 'القادسية',name_level: 'user',name_mange: 'user',
        fkRegoin: "1",idUser: "1",email: "nour@gmail.com", nameuserAdd: '', created_at: '', isActive: '1', fkuserAdd: ''),
    UserModel(
        nameUser: "محمد",fkCountry: "1",mobile: '',path: '',img_image: '',nameRegoin: 'اربيل',name_level: 'user',name_mange: 'user',
        fkRegoin: "1",idUser: "1",email: "moh@gmail.com", nameuserAdd: '', created_at: '', isActive: '1', fkuserAdd: ''),
    UserModel(
        nameUser: "سامر",fkCountry: "1",mobile: '',path: '',img_image: '',nameRegoin: 'بغداد',name_level: 'user',name_mange: 'user',
        fkRegoin: "1",idUser: "1",email: "sss@gmail.com", nameuserAdd: '', created_at: '', isActive: '1', fkuserAdd: ''),
  ];
  var isLoading = false;
  bool isupdate=false;
  late UserModel? selecteduser=null;

  void changevalueuser(UserModel? s){
    selecteduser=s;
    notifyListeners();
  }

  late UserModel currentUser=
  //List<PrivilgeModel> privilgelist=[];

  UserModel(
       nameUser: "aya",fkCountry: "1",mobile: '',path: '',img_image: '',name_level: 'admin',
       fkRegoin: "1",idUser: "1",email: "aya.ghoury@gmail.com", nameuserAdd: '', created_at: '', isActive: '1', fkuserAdd: '');

  Future<void> getuser_vm() async {
    isLoading=true;
    userall = await  UserService().usersServices();
    isLoading=false;
    listuserfilter=List.from(userall);
    isLoading=false;
    notifyListeners();
  }
  void setpath(String path){
    currentUser.path=path;
    notifyListeners();

  }
  Future<void> updateuser_vm(Map<String, String?> body,String? iduser,File? file) async {
    isupdate=true;
    notifyListeners();
    int index = userall.indexWhere(
            (element) =>
        element.idUser ==iduser );
   UserModel ustemp =await UserService()
        .UpdateUser(body: body,idUser: iduser,file: file);
   //if(ustemp.idUser!='0'){
     userall[index]=ustemp;
     getcurrentuser();
     userall[index].path="";
   //}
      listuserfilter=List.from(userall);
      isupdate=false;
     notifyListeners();

   // return result;
  }
    Future<String> adduser_vm(Map<String, String?> body) async {
      isLoading=true;
      notifyListeners();
      UserModel us= await UserService().addUser(body);
      userall.insert(0, us);
      listuserfilter.insert(0, us);
      isLoading=false;
      notifyListeners();
        return "done";
  }

  Future<void> searchProducts(
      String productName) async {
    listuserfilter=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty)
    if(userall.isNotEmpty ){
      userall.forEach((element) {
        if(element.nameUser!.contains(searchKey,0)

            || element.mobile!.contains(searchKey,0) )
          listuserfilter.add(element);
      });
    }
    else listuserfilter= List.from(userall);
    notifyListeners();
  }

  bool getfilteruser(String filter){
    UserModel? user;
    userall.map(
            (e) {
              e.nameUser!.contains(filter);return true;
            }
    );
    return false;
  }
  Future<bool> tryAutoLogin()async{
    final prefs=await SharedPreferences.getInstance();
    if(!prefs.containsKey('id_user')){
      return false;
    }
    final extractedUserData=prefs.getString('id_user');
    notifyListeners();
    return true;
  }
  Future<SharedPreferences> getcurrentuser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      if(userall.isEmpty)
      userall = await  UserService().usersServices();
      String? id = preferences.getString('id_user');
      print('user id sss  ');
      print(id);
      //print("in get user" + userall[0].nameUser.toString());
      if(id!=null) {
      final index = userall.indexWhere(
              (element) => element.idUser == id && element.isActive=='1');
      if(index>=0) {
      currentUser = userall[index];
      currentUser.path="";
      notifyListeners();
      print("preferences");
      print(preferences.containsKey('id_user'));
      preferences.setString("id_user1",'-1');
      return preferences;
      }else {
        SharedPreferences preferences  = await SharedPreferences.getInstance();
        //preferences.setBool(kKeepMeLoggedIn, true);
        preferences.setString("id_user1",'0');
        return preferences;
      }
    }else{
        return preferences;
      }
    }
    catch(e){
      print('exp error is '+e.toString());}
    notifyListeners();
    return preferences;
  }

}