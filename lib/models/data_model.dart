class DataModel {
  final Map coord;
  final List weather;
  final Map main;
  final int visibility;
  final Map wind;
  final Map rain;
  final Map clouds;
  final Map sys;
  final String name;
  DataModel(this.coord, this.weather, this.main, this.visibility, this.wind,
      this.rain, this.clouds, this.sys, this.name);
  DataModel.fromJson(Map<String, dynamic> json)
      : coord = json['coord'],
        weather = json['weather'],
        main = json['main'],
        visibility = json['visibility'],
        wind = json['wind'],
        rain = json['rain'],
        clouds = json['clouds'],
        sys = json['sys'],
        name = json['name'];
  toJson() => {
        'coord': coord,
        'weather': weather,
        'main': main,
        'visibility': visibility,
        'wind': wind,
        'rain': rain,
        'clouds': clouds,
        'sys': sys,
        'name': name,
      };
}
