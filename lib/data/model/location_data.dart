import 'package:json_annotation/json_annotation.dart';

part 'location_data.g.dart';

@JsonSerializable()
class LocationData {
  @JsonKey(name: "esolat_sismim_id")
  String esolatSismimId;
  @JsonKey(name: "no_daftar")
  String noDaftar;
  @JsonKey(name: "no_daftar_num")
  String noDaftarNum;
  @JsonKey(name: "sequent_id")
  String sequentId;
  @JsonKey(name: "nama_masjid")
  String namaMasjid;
  String alamat;
  String poskod;
  @JsonKey(name: "id_negeri")
  String idNegeri;
  @JsonKey(name: "id_jenis")
  String idJenis;
  @JsonKey(name: "id_daerah")
  String idDaerah;
  @JsonKey(name: "id_kariah")
  String idKariah;
  @JsonKey(name: "id_masjid_old")
  String idMasjidOld;
  String takmir;
  @JsonKey(name: "chk_warisan")
  String chkWarisan;
  @JsonKey(name: "chk_pelancongan")
  String chkPelancongan;
  @JsonKey(name: "chk_luarnegara")
  String chkLuarnegara;
  @JsonKey(name: "chk_khairul_jamek")
  String chkKhairuljamek;
  String tel;
  String fax;
  String bank;
  String noAkaun;
  String email;
  @JsonKey(name: "url_website")
  String urlWebsite;
  @JsonKey(name: "id_lama")
  String idLama;
  @JsonKey(name: "no_daftar_surau_lama")
  String noDaftarSurauLama;
  @JsonKey(name: "kod_parlimen")
  String kodParlimen;
  @JsonKey(name: "id_dun")
  String idDun;
  @JsonKey(name: "dt_bina")
  String dtBina;
  String sejarah;
  String binaan;
  String kemudahan;
  String istimewa;
  String lokasi;
  String latitud;
  String longitud;
  String rasmi;
  @JsonKey(name: "dt_rasmi")
  String dtRasmi;
  String kapasiti;
  @JsonKey(name: "luas_tanah")
  String luasTanah;
  String kos;
  @JsonKey(name: "kos_federal")
  String kosFederal;
  @JsonKey(name: "kos_state")
  String kosState;
  @JsonKey(name: "kos_sumbang")
  String kosSumbang;
  @JsonKey(name: "img_name")
  String imgName;
  @JsonKey(name: "img_descr")
  String imgDescr;
  @JsonKey(name: "kelas_takmir")
  String kelasTakmir;
  @JsonKey(name: "id_masjid")
  String idMasjid;
  String distance;

  LocationData({
    this.esolatSismimId,
    this.noDaftar,
    this.noDaftarNum,
    this.sequentId,
    this.namaMasjid,
    this.alamat,
    this.poskod,
    this.idNegeri,
    this.idJenis,
    this.idDaerah,
    this.idKariah,
    this.idMasjidOld,
    this.takmir,
    this.chkWarisan,
    this.chkPelancongan,
    this.chkLuarnegara,
    this.chkKhairuljamek,
    this.tel,
    this.fax,
    this.bank,
    this.noAkaun,
    this.email,
    this.urlWebsite,
    this.idLama,
    this.noDaftarSurauLama,
    this.kodParlimen,
    this.idDun,
    this.dtBina,
    this.sejarah,
    this.binaan,
    this.kemudahan,
    this.istimewa,
    this.lokasi,
    this.latitud,
    this.longitud,
    this.rasmi,
    this.dtRasmi,
    this.kapasiti,
    this.luasTanah,
    this.kos,
    this.kosFederal,
    this.kosState,
    this.kosSumbang,
    this.imgName,
    this.imgDescr,
    this.kelasTakmir,
    this.idMasjid,
    this.distance,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
