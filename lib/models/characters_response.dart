import 'character_model.dart';

class CharactersResponse {
  int? code;
  String? status;
  String? copyright;
  String? etag;
  Data? data;

  CharactersResponse(
      {this.code,
        this.status,
        this.copyright,
        this.etag,
        this.data});

  CharactersResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    etag = json['etag'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['copyright'] = copyright;
    data['etag'] = etag;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<CharacterModel>? results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <CharacterModel>[];
      json['results'].forEach((v) {
        results!.add(CharacterModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['total'] = total;
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
