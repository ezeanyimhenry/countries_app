// To parse this JSON data, do
//
//     final countryInfoModel = countryInfoModelFromJson(jsonString);

import 'dart:convert';

List<CountryInfoModel> countryInfoModelFromJson(String str) =>
    List<CountryInfoModel>.from(
        json.decode(str).map((x) => CountryInfoModel.fromJson(x)));

String countryInfoModelToJson(List<CountryInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryInfoModel {
  CountryInfoModel({
    required this.flags,
    required this.maps,
    this.coatOfArms,
    required this.name,
    required this.capital,
    required this.timezones,
    required this.continents,
    required this.population,
    required this.independent,
    required this.unMember,
    required this.area,
    this.region,
    this.subregion,
    this.languages,
    this.car,
  });

  Flags flags;
  Maps maps;
  CoatOfArms? coatOfArms;
  Name name;
  List<String> capital;
  List<String> timezones;
  List<String> continents;
  String population;
  String? region;
  String area;
  String? subregion;
  Map<String, dynamic>? languages;
  Car? car;
  bool independent;
  bool unMember;

  factory CountryInfoModel.fromJson(Map<String, dynamic> json) =>
      CountryInfoModel(
        flags: Flags.fromJson(json["flags"]),
        maps: Maps.fromJson(json["maps"]),
        coatOfArms: json["coatOfArms"] == null
            ? null
            : CoatOfArms.fromJson(json["coatOfArms"]),
        name: Name.fromJson(json["name"]),
        capital: json["capital"] == null
            ? List<String>.from(["No Item"])
            : List<String>.from(json["capital"].map((x) => x)),
        timezones: json["timezones"] == null
            ? List<String>.from(["No Item"])
            : List<String>.from(json["timezones"].map((x) => x)),
        continents: json["continents"] == null
            ? List<String>.from(["No Item"])
            : List<String>.from(json["continents"].map((x) => x)),
        population: json["population"].toString(),
        region: json["region"] ?? "No Record",
        area: json["area"].toString(),
        subregion: json["subregion"] ?? "No Record",
        independent: json["independent"] ?? "No Record",
        unMember: json["unMember"] ?? "No Record",
        languages: json["languages"] ?? "No Record",
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
      );

  Map<String, dynamic> toJson() => {
        "flags": flags.toJson(),
        "maps": maps.toJson(),
        "coatOfArms": coatOfArms!.toJson(),
        "name": name.toJson(),
        "capital":
            capital == null ? null : List<dynamic>.from(capital.map((x) => x)),
        "timezones": timezones == null
            ? null
            : List<dynamic>.from(timezones.map((x) => x)),
        "continents": continents == null
            ? null
            : List<dynamic>.from(continents.map((x) => x)),
        "population": population,
        "region": region,
        "area": area,
        "subregion": subregion,
        "independent": independent,
        "unMember": unMember,
        "car": car!.toJson(),
        // "languages": languages!.toJson(),
      };
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Car {
  Car({
    this.side,
  });

  String? side;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        side: json["side"],
      );

  Map<String, dynamic> toJson() => {
        "side": side,
      };
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  String googleMaps;
  String openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class CoatOfArms {
  CoatOfArms({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"] == null ? "" : json["png"],
        svg: json["svg"] == null ? "" : json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png == null ? "" : png,
        "svg": svg == null ? "" : svg,
      };
}

class Aed {
  Aed({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  Bam({
    required this.name,
  });

  String name;

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  Eng? eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng!.toJson(),
        "fra": fra == null ? null : fra!.toJson(),
      };
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  String root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"] == null ? null : json["root"],
        suffixes: json["suffixes"] == null
            ? null
            : List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root == null ? null : root,
        "suffixes": suffixes == null
            ? null
            : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  String common;
  String official;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}
