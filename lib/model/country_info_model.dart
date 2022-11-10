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
    required this.name,
    required this.capital,
  });

  Flags flags;
  Name name;
  String capital;

  factory CountryInfoModel.fromJson(Map<String, dynamic> json) =>
      CountryInfoModel(
        flags: Flags.fromJson(json["flags"]),
        name: Name.fromJson(json["name"]),
        capital: json["capital"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "flags": flags.toJson(),
        "name": name.toJson(),
        "capital": capital,
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
