class Mobil {
  String? id;
  String merk;
  String nama;
  String tahun;
  String warna;
  String transmisi;
  String kapasitas;
  String stok;
  String hargasewa;

  Mobil(
      {this.id,
      required this.merk,
      required this.nama,
      required this.tahun,
      required this.warna,
      required this.transmisi,
      required this.kapasitas,
      required this.stok,
      required this.hargasewa});

  factory Mobil.fromJson(Map<String, dynamic> json) => Mobil(
      id: json["id"],
      merk: json["merk"],
      nama: json["nama"],
      tahun: json["tahun"],
      warna: json["warna"],
      transmisi: json["transmisi"],
      kapasitas: json["kapasitas"],
      stok: json["stok"],
      hargasewa: json["hargasewa"]);

  Map<String, dynamic> toJson() => {
        "merk": merk,
        "nama": nama,
        "tahun": tahun,
        "warna": warna,
        "transmisi": transmisi,
        "kapasitas": kapasitas,
        "stok": stok,
        "hargasewa": hargasewa,
      };
}
