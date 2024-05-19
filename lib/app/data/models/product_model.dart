class Product {
  int? productID;
  String? productName;
  String? image;
  int? realPrice;
  String? realSkinType;
  int? rating;

  Product(
      {this.productID,
      this.productName,
      this.image,
      this.realPrice,
      this.realSkinType,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    image = json['Image'];
    realPrice = json['RealPrice'];
    realSkinType = json['RealSkinType'];
    rating = json['Rating'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ProductID'] = productID;
    data['ProductName'] = productName;
    data['Image'] = image;
    data['RealPrice'] = realPrice;
    data['RealSkinType'] = realSkinType;
    data['Rating'] = rating;
    return data;
  }
}
