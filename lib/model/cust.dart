class Cust {
  String? id;
  String namaCust;
  String jenisKelCust;
  String alamatCust;
  String noTelpCust;

  Cust({
    this.id,
    required this.namaCust,
    required this.jenisKelCust,
    required this.alamatCust,
    required this.noTelpCust,
  });

  factory Cust.fromJson(Map<String, dynamic> json) => Cust(
      id: json["id"],
      namaCust: json["namaCust"],
      jenisKelCust: json["jenisKelCust"],
      alamatCust: json["alamatCust"],
      noTelpCust: json["noTelpCust"]);

  Map<String, dynamic> toJson() => {
        "namaCust": namaCust,
        "jenisKelCust": jenisKelCust,
        "alamatCust": alamatCust,
        "noTelpCust": noTelpCust
      };
}
