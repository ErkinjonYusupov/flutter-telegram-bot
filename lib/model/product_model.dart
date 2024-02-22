class ProductModel {
  int id;
  String title;
  int price;

  ProductModel({required this.id, required this.price, required this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'], price: json['price'], title: json['title']);
  }
}


List<ProductModel> productFromModel(List list){
  return List<ProductModel>.from(list.map((e) => ProductModel.fromJson(e)));
}