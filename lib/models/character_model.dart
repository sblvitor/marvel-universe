class CharacterModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Comics? comics;
  Comics? series;
  Comics? stories;
  Comics? events;
  List<Urls>? urls;

  CharacterModel(
      {this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceURI,
        this.comics,
        this.series,
        this.stories,
        this.events,
        this.urls});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
    json['comics'] != null ? Comics.fromJson(json['comics']) : null;
    series =
    json['series'] != null ? Comics.fromJson(json['series']) : null;
    stories =
    json['stories'] != null ? Comics.fromJson(json['stories']) : null;
    events =
    json['events'] != null ? Comics.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;
    if (comics != null) {
      data['comics'] = comics!.toJson();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (stories != null) {
      data['stories'] = stories!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}

class Comics {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;

  Items({this.resourceURI, this.name});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }
}

class ItemsStory {
  String? resourceURI;
  String? name;
  String? type;

  ItemsStory({this.resourceURI, this.name, this.type});

  ItemsStory.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}