class maintype {
  int? id;
  String? name;
  String? img;

  maintype({required this.id, required this.name, required this.img});

  factory maintype.fromJson(Map<String, dynamic> json) {
    return maintype(
      id: json['id'] ?? 0,
      name: json['type_name_ar'] ?? 'Default Title',
      img: json['type_image'] ?? 'Default image',
    );
  }
}
