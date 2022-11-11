// To parse this JSON data, do
//
//     final countryInfoModel = countryInfoModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

List<CountryInfoModel> countryInfoModelFromJson(String str) =>
    List<CountryInfoModel>.from(
        json.decode(str).map((x) => CountryInfoModel.fromJson(x)));

String countryInfoModelToJson(List<CountryInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryInfoModel {
  CountryInfoModel({
    required this.flags,
    required this.maps,
    required this.coatOfArms,
    required this.name,
    required this.capital,
    required this.population,
    this.region,
    // this.motto,
    this.languages,
    // this.ethic,
    // this.religion,
    // this.government,
    // this.independence,
    // this.area,
    // this.currency,
    // this.gdp,
    // this.timezone,
    // this.dateformat,
    // this.dailingcode,
    // this.drivingside,
  });

  Flags flags;
  Maps maps;
  CoatOfArms coatOfArms;
  Name name;
  String capital;
  String population;
  String? region;
  Map<String, dynamic>? languages;

  factory CountryInfoModel.fromJson(Map<String, dynamic> json) =>
      CountryInfoModel(
        flags: Flags.fromJson(json["flags"]),
        maps: Maps.fromJson(json["maps"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        name: Name.fromJson(json["name"]),
        capital: json["capital"].toString(),
        population: json["population"].toString(),
        region: json["region"],
        languages: json!["languages"],
      );

  Map<String, dynamic> toJson() => {
        "flags": flags.toJson(),
        "maps": maps.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "name": name.toJson(),
        "capital": capital,
        "population": population,
        "region": region,
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
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

// class Languages {
//   Languages({
//     required this.language,
//     // required this.svg,
//   });

//   String? language;
//   // String svg;

//   factory Languages.fromJson(Map<String, dynamic> json) => Languages(
//         language: json[0],
//         // svg: json["svg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "language": [0],
//         // "svg": svg,
//       };
// }

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
