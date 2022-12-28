class Food {
  String kode_makanan;
  String nama_makanan;
  String gambar;
  List rasa = [];

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    kode_makanan = data['kode_makanan'];
    nama_makanan = data['nama_makanan'];
    gambar = data['gambar'];
    rasa = data['rasa'];
  }

  Map<String, dynamic> toMap() {
    return {
      'kode_makanan': kode_makanan,
      'nama_makanan': nama_makanan,
      'gambar': gambar,
      'rasa': rasa,
    };
  }
}
