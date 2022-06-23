class ProductModel {

  ProductModel({
    this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.typeproduct,
    required this.expire,
     required this.fkuser,
    // this.value_config
  });
  String? idProduct;
  late final String nameProduct;
  late final String priceProduct;
  late final String typeproduct;
  late final String expire;
  late String? fkuser;
  // late final String? value_config;

  ProductModel.fromJson(Map<String, dynamic> json){
    idProduct = json['id_product'];
    nameProduct = json['nameProduct'];
    priceProduct = json['priceProduct'];
    typeproduct = json['typeproduct'];
    expire = json['expire'];
    fkuser = json['fkuser'];
    // value_config = json['value_config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_product'] = idProduct;
    _data['nameProduct'] = nameProduct;
    _data['priceProduct'] = priceProduct;
    _data['typeproduct'] = typeproduct;
    _data['expire'] = expire;
    _data['fkuser'] = fkuser;
    // _data['value_config']=value_config;
    return _data;
  }
}