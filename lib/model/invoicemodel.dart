
class InvoiceModel {
  InvoiceModel({
    required this.idInvoice,
    required this.dateCreate,
    required this.typePay,
    required this.nameproduct,
    required this.total,
    required this.amount_paid,
    required this.typeinvoice,
    required this.name_customer,
    this.fkcus,
    this.fkuser,
    this.nameUser,
    this.nameregoin,
    required this.products,

  });
  String? idInvoice;
  String? dateCreate;
  String? typePay;
  String? nameproduct;
  String? total;
  String? amount_paid;
  String? typeinvoice;//مرتجع/كامل
  String? name_customer;
  String? fkuser;
  String? fkcus;
  String? nameUser;
  String? nameregoin;
  List<ProductsInvoice>? products;

  InvoiceModel.fromJson(Map<String, dynamic> json){
    idInvoice = json['idInvoice'];
    dateCreate = json['dateCreate'];
    typePay = json['typePay'];
    nameproduct = json['nameproduct'];
    total = json['total'];
    amount_paid = json['amount_paid'];
    typeinvoice = json['typeinvoice'];
    name_customer = json['name_customer'];
    fkuser = json['fkuser'];
    fkcus = json['fkcus'];
    nameUser = json['nameUser'];
    nameregoin = json['nameregoin'];
    products=getproud(json['products']);

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idInvoice'] = idInvoice;
    _data['dateCreate'] = dateCreate;
    _data['typePay'] = typePay;
    _data['nameproduct'] = nameproduct;
    _data['total'] = total;
    _data['amount_paid'] = amount_paid;
    _data['typeinvoice'] = typeinvoice;
    _data['name_customer'] = name_customer;
    _data['fkuser'] = fkuser;
    _data['fkcus'] = fkcus;
    _data['nameUser'] = nameUser;
    _data['nameregoin'] = nameregoin;
    _data['products'] =
        products!.map((e)=>e.toJson()).toList();
    return _data;
  }
    List<ProductsInvoice> getproud(data) {
    List<ProductsInvoice> prodlist = [];
    if(data!=null){
      for (int i = 0; i < data.length; i++) {
        print(i);
        prodlist.add(
            ProductsInvoice.fromJson(data[i])
        );
      }
    }
    return prodlist;

  }
}

class ProductsInvoice {

  ProductsInvoice({
  this.idInvoiceProduct,
  this.fkIdInvoice,
  this.fkProduct,
  this.amount,
  this.price,
    this.fkcus,
    this.fkuser,
    this.nameProduct,
    // required this.quantity,
  });
  late  String? idInvoiceProduct;
  late  String? fkIdInvoice;
  late  String? fkProduct;
  late  String? amount;
  late  String? price;
  late  String? nameProduct;

  // String? quantity;

  String? fkuser;
  String? fkcus;
  ProductsInvoice.fromJson(Map<String, dynamic> json){
    print('in product from json ');
    print(json);
    idInvoiceProduct = json['id_invoice_product'];
    fkIdInvoice = json['fk_id_invoice'];
    // quantity = json['quantity'];
    fkProduct = json['fk_product'];
    amount = json['amount'];
    price = json['price'];
    fkuser = json['fkuser'];
    fkcus = json['fkcus'];
    nameProduct = json['nameProduct'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_invoice_product'] = idInvoiceProduct;
    _data['fk_id_invoice'] = fkIdInvoice;
    _data['fk_product'] = fkProduct;
    _data['amount'] = amount;
    _data['nameProduct'] = nameProduct;
    _data['price'] = price;
    _data['fkuser'] = fkuser;
    _data['fkcus'] = fkcus;
    return _data;
  }
}