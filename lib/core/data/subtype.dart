class subtype {
  String? id;
  String? maintypeid;
  String? name;

  subtype({required this.id, required this.maintypeid, required this.name});

  factory subtype.fromJson(Map<String, dynamic> json) {
    return subtype(
      id: json['subtype_id'],
      maintypeid: json['main_type_id'],
      name: json['subtype_name'] ?? 'Default image',
    );
  }
}
