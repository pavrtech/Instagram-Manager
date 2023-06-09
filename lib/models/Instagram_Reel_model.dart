class Autogenerated {
  String? id;
  String? username;
  List<Videos>? videos;

  Autogenerated({this.id, this.username, this.videos});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  String? caption;
  String? description;
  String? resolution;
  String? uploadDate;
  String? thumbnail;
  String? url;

  Videos(
      {this.caption,
      this.description,
      this.resolution,
      this.uploadDate,
      this.thumbnail,
      this.url});

  Videos.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    description = json['description'];
    resolution = json['resolution'];
    uploadDate = json['uploadDate'];
    thumbnail = json['thumbnail'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['description'] = this.description;
    data['resolution'] = this.resolution;
    data['uploadDate'] = this.uploadDate;
    data['thumbnail'] = this.thumbnail;
    data['url'] = this.url;
    return data;
  }
}
