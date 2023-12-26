class Products {
  String? id;
  String? name;
  String? image;
  String? offer;
  String? description;
  String? price;
  String? mainType;
  String? SubType;
  String? evaluation;

  Products({
    this.id,
    this.name,
    this.image,
    this.offer,
    this.description,
    this.price,
    this.mainType,
    this.SubType,
    this.evaluation,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['product_id'] ?? '',
      name: json['product_name'] ?? 'Default Title',
      image: json['product_image'] ?? 'Default en',
      offer: json['product_offer'] ?? 'Default image',
      description: json['product_description'] ?? '',
      price: json['product_price'] ?? 'Default Title',
      mainType: json['type_name'] ?? 'Default en',
      SubType: json['subtype_name'] ?? 'Default image',
      evaluation: json['evaluation'] ?? 'Default image',
    );
  }
}
