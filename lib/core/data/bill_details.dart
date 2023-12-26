class billDEtail {
  String? id;
  String? date;
  String? totalprice;

  String? moreInfo;
  String? productImage;
  String? name;
  double? price;
  int? quantity;

  billDEtail({
    required this.id,
    required this.totalprice,
    required this.date,
    required this.moreInfo,
    required this.productImage,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory billDEtail.fromJson(Map<String, dynamic> json) {
    return billDEtail(
      id: json["id"],
      totalprice: json["total_price"],
      date: json["date"],
      moreInfo: json["more_info"] ?? ' no data ',
      productImage: json["product_image"],
      name: json["name"],
      price: double.parse(json["price"]),
      quantity: int.parse(json["quantity"]),
    );
  }
}
