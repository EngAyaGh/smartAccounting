
class InvoiceModel {
  InvoiceModel({
    required this.idInvoice,
    required this.dateCreate,
    required this.typePay,
    required this.nameproduct,
    required this.quantity,
    required this.total,
  });
  String? idInvoice;
  String? dateCreate;
  String? typePay;
  String? nameproduct;
  String? quantity;
  String? total;

  InvoiceModel.fromJson(Map<String, dynamic> json){
    idInvoice = json['idInvoice'];
    dateCreate = json['dateCreate'];
    typePay = json['typePay'];
    nameproduct = json['nameproduct'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idInvoice'] = idInvoice;
    _data['dateCreate'] = dateCreate;
    _data['typePay'] = typePay;
    _data['nameproduct'] = nameproduct;
    _data['quantity'] = quantity;
    _data['total'] = total;


    return _data;
  }
}