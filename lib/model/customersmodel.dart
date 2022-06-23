
class CustomerModel {
  CustomerModel({
    this.idcustomer,
    required this.namecustom,
    required this.addresscustom,
    required this.mobile,
     required this.typecustom,
     required this.fkuser,
    // this.value_config
  });
  String? idcustomer;
  late final String namecustom;
  late final String addresscustom;
  late final String mobile;
   late final String typecustom;
   late String? fkuser;
  // late final String? value_config;

  CustomerModel.fromJson(Map<String, dynamic> json){
    idcustomer = json['idcustomer'];
    namecustom = json['namecustom'];
    addresscustom = json['addresscustom'];
    mobile = json['mobile'];
    typecustom = json['typecustom'];
    fkuser = json['fkuser'];
    // value_config = json['value_config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idcustomer'] = idcustomer;
    _data['namecustom'] = namecustom;
    _data['addresscustom'] = addresscustom;
    _data['mobile'] = mobile;
    _data['typecustom'] = typecustom;
     _data['fkuser'] = fkuser;
    // _data['value_config']=value_config;
    return _data;
  }
}