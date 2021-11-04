class DailyWeather {

  double? lat;
  double? lon;
  String? timezone;
  dynamic timezoneOffset;
  Current? current;
  List<Minutely>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;


  DailyWeather({
      this.lat, 
      this.lon, 
      this.timezone,
      this.timezoneOffset,
      this.current, 
      this.minutely, 
      this.hourly, 
      this.daily,});

  DailyWeather.fromJson(Map<String,dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['minutely'] != null) {
      minutely = [];
      json['minutely'].forEach((v) {
        minutely?.add(Minutely.fromJson(v));
      });
    }
    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly?.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily?.add(Daily.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    if (current != null) {
      map['current'] = current?.toJson();
    }
    if (minutely != null) {
      map['minutely'] = minutely?.map((v) => v.toJson()).toList();
    }
    if (hourly != null) {
      map['hourly'] = hourly?.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      map['daily'] = daily?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Daily {
  Daily({
      this.dt, 
      this.sunrise, 
      this.sunset, 
      this.moonrise, 
      this.moonset, 
      this.moonPhase, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.windSpeed, 
      this.windDeg, 
      this.windGust, 
      this.weather, 
      this.clouds, 
      this.pop, 
      this.uvi,});

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'];
    uvi = json['uvi'];
  }
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  dynamic moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  dynamic windGust;
  List<Weather>? weather;
  int? clouds;
  dynamic pop;
  dynamic uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    if (temp != null) {
      map['temp'] = temp?.toJson();
    }
    if (feelsLike != null) {
      map['feels_like'] = feelsLike?.toJson();
    }
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = clouds;
    map['pop'] = pop;
    map['uvi'] = uvi;
    return map;
  }

}

class Weather {
  Weather({
      this.id, 
      this.main, 
      this.description, 
      this.icon,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}

class FeelsLike {
  FeelsLike({
      this.day, 
      this.night, 
      this.eve, 
      this.morn,});

  FeelsLike.fromJson(dynamic json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }
  dynamic day;
  dynamic night;
  dynamic eve;
  dynamic morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }

}

class Temp {
  Temp({
      this.day, 
      this.min, 
      this.max, 
      this.night, 
      this.eve, 
      this.morn,});

  Temp.fromJson(dynamic json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }
  dynamic day;
  dynamic min;
  dynamic max;
  dynamic night;
  dynamic eve;
  dynamic morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }

}

class Hourly {
  Hourly({
      this.dt, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.uvi, 
      this.clouds, 
      this.visibility, 
      this.windSpeed, 
      this.windDeg, 
      this.windGust, 
      this.weather, 
      this.pop,});

  Hourly.fromJson(dynamic json) {
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    pop = json['pop'];
  }
  dynamic dt;
  dynamic temp;
  dynamic feelsLike;
  dynamic pressure;
  dynamic humidity;
  dynamic dewPoint;
  dynamic uvi;
  dynamic clouds;
  dynamic visibility;
  dynamic windSpeed;
  dynamic windDeg;
  dynamic windGust;
  List<Weather>? weather;
  dynamic pop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['uvi'] = uvi;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['pop'] = pop;
    return map;
  }

}


class Minutely {
  Minutely({
      this.dt, 
      this.precipitation,});

  Minutely.fromJson(dynamic json) {
    dt = json['dt'];
    precipitation = json['precipitation'];
  }
  int? dt;
  int? precipitation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['precipitation'] = precipitation;
    return map;
  }

}

class Current {
  Current({
      this.dt, 
      this.sunrise, 
      this.sunset, 
      this.temp, 
      this.feelsLike, 
      this.pressure, 
      this.humidity, 
      this.dewPoint, 
      this.uvi, 
      this.clouds, 
      this.visibility, 
      this.windSpeed, 
      this.windDeg, 
      this.windGust, 
      this.weather,});

  Current.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
  }
  int? dt;
  int? sunrise;
  int? sunset;
  dynamic temp;
  dynamic feelsLike;
  int? pressure;
  int? humidity;
  dynamic dewPoint;
  dynamic uvi;
  int? clouds;
  int? visibility;
  dynamic windSpeed;
  int? windDeg;
  dynamic windGust;
  List<Weather>? weather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['uvi'] = uvi;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
