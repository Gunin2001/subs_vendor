// ignore_for_file: file_names
/*
class VendorProducts {
  VendorProducts({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;
  
  VendorProducts.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this._id,
    required this.category,
    required this.name,
    required this.price,
    required this.unit,
    required this.image,
    required this.vendorid,
    required this.vendorphoneno,
    required this.createdAt,
    required this.updatedAt,
    required this._V,
  });
  late final String _id;
  late final String category;
  late final String name;
  late final int price;
  late final String unit;
  late final String image;
  late final String vendorid;
  late final String vendorphoneno;
  late final String createdAt;
  late final String updatedAt;
  late final int? _V;
  
  Data.fromJson(Map<String, dynamic> json){
    _id = json['_id'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    unit = json['unit'];
    image = json['image'];
    vendorid = json['vendorid'];
    vendorphoneno = json['vendorphoneno'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    _V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = _id;
    _data['category'] = category;
    _data['name'] = name;
    _data['price'] = price;
    _data['unit'] = unit;
    _data['image'] = image;
    _data['vendorid'] = vendorid;
    _data['vendorphoneno'] = vendorphoneno;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = _V;
    return _data;
  }
}*/