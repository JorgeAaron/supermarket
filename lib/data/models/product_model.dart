class Product {
  int id;
  String name;
  int price;
  bool sale;
  double stock;
  String imageUrl;

  Product({this.name, this.price, this.sale, this.stock, this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "sale": sale,
      "stock": stock,
      "imageUrl": imageUrl
    };
  }

  Product.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    price = map['price'];
    sale = map['sale'];
    stock = map['stock'];
    imageUrl = map['imageUrl'];
    id = map['id'];
  }
}
