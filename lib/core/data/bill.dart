class Bill {
  String? id;
  String? date;
  String? totalprice;
  String? statuse;
  String? nameDelliverFor;
  String? numberDeliverFor;
  String? moreInfo;

  Bill({
    required this.id,
    required this.date,
    required this.totalprice,
    required this.statuse,
    required this.nameDelliverFor,
    required this.numberDeliverFor,
    required this.moreInfo,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'] ?? '',
      date: json['date'] ?? 'Default Title',
      totalprice: json['total_price'] ?? 'Default Title',
      statuse: json['name'] ?? 'Default Title',
      nameDelliverFor: json["name_delliver_for"] ?? ' no data ',
      numberDeliverFor: json["number_deliver_for"] ?? ' no data ',
      moreInfo: json["more_info"] ?? ' no data ',
    );
  }
}
