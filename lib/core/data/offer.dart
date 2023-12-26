class offer {
  String? id;
  String? img;

  offer({
    required this.id,
    required this.img,
  });

  factory offer.fromJson(Map<String, dynamic> json) {
    return offer(
      id: json['offer_id'] ?? '',
      img: json['offer_image'] ?? 'Default Title',
    );
  }
}
