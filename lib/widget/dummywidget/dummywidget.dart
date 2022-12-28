class Food {
  String kode_makanan;
  String nama_makanan;
  String gambar;
  List rasa;

  Food.fromMap(Map<String, dynamic> data) {
    kode_makanan = data["kode_makanan"];
    nama_makanan = data["nama_makanan"];
    gambar = data["gambar"];
    rasa = data["rasa"];
  }
}
