class Feed {
  String gambarUtama;
  String deskripsi;
  List isi_feed;

  Feed({this.gambarUtama, this.deskripsi, this.isi_feed});
  factory Feed.fromMap(Map<String, dynamic> map) => Feed(
      gambarUtama: map["gambar_utama"],
      deskripsi: map["deskripsi"],
      isi_feed: map["isi_feed"]);
  Map<String, dynamic> toMap() => {
        "gambar_utama": gambarUtama,
        "deskripsi": deskripsi,
        "isi_feed": isi_feed,
      };
}
