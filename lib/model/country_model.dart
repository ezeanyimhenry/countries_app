// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    required this.flags,
    required this.name,
    // required this.username,
    // required this.email,
    // required this.address,
    // required this.phone,
    // required this.website,
    // required this.company,
  });

  Flags flags;
  Name name;
  // String username;
  // String email;
  // Address address;
  // String phone;
  // String website;
  // Company company;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flags: Flags.fromJson(json["flags"]),
        name: Name.fromJson(json["name"]),
        // username: json["username"],
        // email: json["email"],
        // address: Address.fromJson(json["address"]),
        // phone: json["phone"],
        // website: json["website"],
        // company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "flags": flags.toJson(),
        "name": name.toJson(),
        // "username": username,
        // "email": email,
        // "address": address.toJson(),
        // "phone": phone,
        // "website": website,
        // "company": company.toJson(),
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
  // String flags;
  // String zipcode;
  // Geo geo;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        // flags: json["flags"],
        // zipcode: json["zipcode"],
        // geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        // "city": city,
        // "zipcode": zipcode,
        // "geo": geo.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
