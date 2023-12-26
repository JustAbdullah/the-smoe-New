class Cart {
  String? id;
  String? userid;
  String? productId;
  String? productname;
  int? quantityproduct;
  String? productImage;
  double? productPrice;

  Cart({
    this.id,
    this.userid,
    this.productId,
    this.productname,
    this.quantityproduct,
    this.productImage,
    this.productPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['cart_id'] ?? '',
      userid: json['cart_user_id'] ?? 'Default name',
      productId: json['cart_product_id'] ?? 'Default name',
      productname: json['product_name'] ?? 'Default en',
      quantityproduct: int.parse(json['cart_product_quantity']),
      productImage: json['product_image'] ?? '',
      productPrice: double.parse(json['product_price']),
    );
  }
}
