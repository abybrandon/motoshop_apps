import 'package:cloud_firestore/cloud_firestore.dart';

class Motors {
  String id;
  String judul;
  int tahun_motor;
  String merk_motor;
  String kode_jual;
  int jarak_tempuh;
  String gambar_utama;
  String dekripsi;
  List gambar_lain = [];
  List arrayaja = [];
  String tipe_motor;
  String pajak_motor;
  String plat_motor;
  int harga;
  Timestamp created;
  Timestamp updatedAt;

  Motors();

  Motors.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    judul = data["judul"];
    tahun_motor = data["tahun_motor"];
    merk_motor = data["merk_motor"];
    kode_jual = data["kode_jual"];
    jarak_tempuh = data["jarak_tempuh"];
    gambar_utama = data["gambar_utama"];
    gambar_lain = data["gambar_lain"];
    dekripsi = data["dekripsi"];
    harga = data["harga"];
    pajak_motor = data["pajak_motor"];
    tipe_motor = data["tipe_motor"];
    plat_motor = data["plat_motor"];
    created = data["created"];
    updatedAt = data["updatedAt"];
    arrayaja = data["arrayaja"];
  }

  get connectionState => null;
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'tahun_motor': tahun_motor,
      'merk_motor': merk_motor,
      'kode_jual': kode_jual,
      'jarak_tempuh': jarak_tempuh,
      'gambar_utama': gambar_utama,
      'gambar_lain': gambar_lain,
      'dekripsi': dekripsi,
      'harga': harga,
      'pajak_motor': pajak_motor,
      'tipe_motor': tipe_motor,
      'plat_motor': plat_motor,
      'created': created,
      'arrayaja': arrayaja,
      'updatedAt': updatedAt
    };
  }
}
