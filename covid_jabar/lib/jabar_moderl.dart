class JabarModel {
  final int? statusCode;
  final Data? data;

  JabarModel({
    this.statusCode,
    this.data,
  });

  JabarModel.fromJson(Map<String, dynamic> json)
      : statusCode = json['status_code'] as int?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status_code' : statusCode,
    'data' : data?.toJson()
  };
}

class Data {
  final Metadata? metadata;
  final List<Content>? content;

  Data({
    this.metadata,
    this.content,
  });

  Data.fromJson(Map<String, dynamic> json)
      : metadata = (json['metadata'] as Map<String,dynamic>?) != null ? Metadata.fromJson(json['metadata'] as Map<String,dynamic>) : null,
        content = (json['content'] as List?)?.map((dynamic e) => Content.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'metadata' : metadata?.toJson(),
    'content' : content?.map((e) => e.toJson()).toList()
  };
}

class Metadata {
  final String? lastUpdate;

  Metadata({
    this.lastUpdate,
  });

  Metadata.fromJson(Map<String, dynamic> json)
      : lastUpdate = json['last_update'] as String?;

  Map<String, dynamic> toJson() => {
    'last_update' : lastUpdate
  };
}

class Content {
  final String? kodeProv;
  final String? namaProv;
  final String? kodeKab;
  final String? namaKab;
  final int? odpProses;
  final int? odpSelesai;
  final int? odpTotal;
  final int? pdpProses;
  final int? pdpSelesai;
  final int? pdpTotal;
  final int? otgProses;
  final int? otgSelesai;
  final int? otgTotal;
  final int? positif;
  final int? sembuh;
  final int? meninggal;
  final int? odpMeninggal;
  final int? pdpMeninggal;
  final int? otgMeninggal;

  Content({
    this.kodeProv,
    this.namaProv,
    this.kodeKab,
    this.namaKab,
    this.odpProses,
    this.odpSelesai,
    this.odpTotal,
    this.pdpProses,
    this.pdpSelesai,
    this.pdpTotal,
    this.otgProses,
    this.otgSelesai,
    this.otgTotal,
    this.positif,
    this.sembuh,
    this.meninggal,
    this.odpMeninggal,
    this.pdpMeninggal,
    this.otgMeninggal,
  });

  Content.fromJson(Map<String, dynamic> json)
      : kodeProv = json['kode_prov'] as String?,
        namaProv = json['nama_prov'] as String?,
        kodeKab = json['kode_kab'] as String?,
        namaKab = json['nama_kab'] as String?,
        odpProses = json['odp_proses'] as int?,
        odpSelesai = json['odp_selesai'] as int?,
        odpTotal = json['odp_total'] as int?,
        pdpProses = json['pdp_proses'] as int?,
        pdpSelesai = json['pdp_selesai'] as int?,
        pdpTotal = json['pdp_total'] as int?,
        otgProses = json['otg_proses'] as int?,
        otgSelesai = json['otg_selesai'] as int?,
        otgTotal = json['otg_total'] as int?,
        positif = json['positif'] as int?,
        sembuh = json['sembuh'] as int?,
        meninggal = json['meninggal'] as int?,
        odpMeninggal = json['odp_meninggal'] as int?,
        pdpMeninggal = json['pdp_meninggal'] as int?,
        otgMeninggal = json['otg_meninggal'] as int?;

  Map<String, dynamic> toJson() => {
    'kode_prov' : kodeProv,
    'nama_prov' : namaProv,
    'kode_kab' : kodeKab,
    'nama_kab' : namaKab,
    'odp_proses' : odpProses,
    'odp_selesai' : odpSelesai,
    'odp_total' : odpTotal,
    'pdp_proses' : pdpProses,
    'pdp_selesai' : pdpSelesai,
    'pdp_total' : pdpTotal,
    'otg_proses' : otgProses,
    'otg_selesai' : otgSelesai,
    'otg_total' : otgTotal,
    'positif' : positif,
    'sembuh' : sembuh,
    'meninggal' : meninggal,
    'odp_meninggal' : odpMeninggal,
    'pdp_meninggal' : pdpMeninggal,
    'otg_meninggal' : otgMeninggal
  };
}