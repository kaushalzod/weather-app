class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;
  String? pod;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset, this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    pod = json['pod'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['pod'] = pod;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
