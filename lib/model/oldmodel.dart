// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators, constant_identifier_names

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
    required this.borders,
    required this.gini,
  });

  Name name;
  List<String>? tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  Status? status;
  bool unMember;
  Currencies? currencies;
  Idd idd;
  List<String>? capital;
  List<String> altSpellings;
  Region? region;
  String subregion;
  Map<String, String>? languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  double area;
  Demonyms? demonyms;
  String flag;
  Maps maps;
  int population;
  String fifa;
  Car car;
  List<String> timezones;
  List<Continent> continents;
  CoatOfArms flags;
  CoatOfArms coatOfArms;
  StartOfWeek? startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode? postalCode;
  List<String>? borders;
  Map<String, double>? gini;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? null
            : List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: statusValues.map[json["status"]],
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        idd: Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? null
            : List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: regionValues.map[json["region"]],
        subregion: json["subregion"],
        languages: json["languages"] == null
            ? null
            : Map.from(json["languages"])
                .map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
        landlocked: json["landlocked"],
        area: json["area"].toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        fifa: json["fifa"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<Continent>.from(
            json["continents"].map((x) => continentValues.map[x])),
        flags: CoatOfArms.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]],
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
        borders: json["borders"] == null
            ? null
            : List<String>.from(json["borders"].map((x) => x)),
        gini: json["gini"] == null
            ? null
            : Map.from(json["gini"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": tld == null ? null : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": statusValues.reverse[status],
        "unMember": unMember,
        "currencies": currencies == null ? null : currencies!.toJson(),
        "idd": idd.toJson(),
        "capital":
            capital == null ? null : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": regionValues.reverse[region],
        "subregion": subregion,
        "languages": languages == null
            ? null
            : Map.from(languages!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms == null ? null : demonyms!.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        "fifa": fifa,
        "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(
            continents.map((x) => continentValues.reverse[x])),
        "flags": flags.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo.toJson(),
        "postalCode": postalCode == null ? null : postalCode!.toJson(),
        "borders":
            borders == null ? null : List<dynamic>.from(borders!.map((x) => x)),
        "gini": gini == null
            ? null
            : Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  List<double>? latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? null : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  Car({
    required this.signs,
    required this.side,
  });

  List<String>? signs;
  Side? side;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? null
            : List<String>.from(json["signs"].map((x) => x)),
        side: sideValues.map[json["side"]],
      );

  Map<String, dynamic> toJson() => {
        "signs":
            signs == null ? null : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { LEFT, RIGHT }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.RIGHT});

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

enum Continent {
  NORTH_AMERICA,
  ASIA,
  AFRICA,
  SOUTH_AMERICA,
  EUROPE,
  OCEANIA,
  ANTARCTICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currencies {
  Currencies({
    required this.bbd,
    required this.usd,
    required this.xaf,
    required this.brl,
    required this.eur,
    required this.aud,
    required this.kid,
    required this.ron,
    required this.lak,
    required this.xof,
    required this.iqd,
    required this.kes,
    required this.kyd,
    required this.gnf,
    required this.tnd,
    required this.bob,
    required this.cny,
    required this.krw,
    required this.kwd,
    required this.dzd,
    required this.awg,
    required this.rub,
    required this.dkk,
    required this.gbp,
    required this.twd,
    required this.cad,
    required this.fjd,
    required this.xpf,
    required this.pen,
    required this.clp,
    required this.egp,
    required this.mkd,
    required this.bdt,
    required this.sgd,
    required this.etb,
    required this.bsd,
    required this.tmt,
    required this.ang,
    required this.zmw,
    required this.hnl,
    required this.mad,
    required this.npr,
    required this.xcd,
    required this.omr,
    required this.hkd,
    required this.pyg,
    required this.mdl,
    required this.kgs,
    required this.mur,
    required this.btn,
    required this.inr,
    required this.yer,
    required this.imp,
    required this.dop,
    required this.ggp,
    required this.lrd,
    required this.zwl,
    required this.ugx,
    required this.vuv,
    required this.ils,
    required this.jod,
    required this.pkr,
    required this.bnd,
    required this.aed,
    required this.gel,
    required this.scr,
    required this.fkp,
    required this.gip,
    required this.sbd,
    required this.uzs,
    required this.mnt,
    required this.gyd,
    required this.bam,
    required this.top,
    required this.rwf,
    required this.bgn,
    required this.ngn,
    required this.shp,
    required this.fok,
    required this.lsl,
    required this.zar,
    required this.cve,
    required this.kpw,
    required this.cuc,
    required this.cup,
    required this.srd,
    required this.nzd,
    required this.mxn,
    required this.php,
    required this.sek,
    required this.jmd,
    required this.ves,
    required this.jep,
    required this.afn,
    required this.mop,
    required this.syp,
    required this.stn,
    required this.chf,
    required this.szl,
    required this.myr,
    required this.pln,
    required this.ssp,
    required this.khr,
    required this.lkr,
    required this.ghs,
    required this.ern,
    required this.bzd,
    required this.ttd,
    required this.ckd,
    required this.mzn,
    required this.irr,
    required this.cdf,
    required this.mvr,
    required this.mru,
    required this.czk,
    required this.byn,
    required this.all,
    required this.mwk,
    required this.sos,
    required this.rsd,
    required this.isk,
    required this.wst,
    required this.mmk,
    required this.thb,
    required this.lbp,
    required this.kzt,
    required this.tvd,
    required this.huf,
    required this.nok,
    required this.kmf,
    required this.sdg,
    required this.amd,
    required this.uyu,
    required this.sar,
    required this.bif,
    required this.uah,
    required this.sll,
    required this.bmd,
    required this.nad,
    required this.htg,
    required this.lyd,
    required this.pgk,
    required this.aoa,
    required this.idr,
    required this.ars,
    required this.pab,
    required this.jpy,
    required this.nio,
    required this.tzs,
    required this.tjs,
    required this.gtq,
    required this.bhd,
    required this.mga,
    required this.djf,
    required this.gmd,
    required this.bwp,
    required this.currenciesTry,
    required this.azn,
    required this.crc,
    required this.vnd,
    required this.hrk,
    required this.qar,
    required this.cop,
  });

  Aed? bbd;
  Aed? usd;
  Aed? xaf;
  Aed? brl;
  Aed? eur;
  Aed? aud;
  Aed? kid;
  Aed? ron;
  Aed? lak;
  Aed? xof;
  Aed? iqd;
  Aed? kes;
  Aed? kyd;
  Aed? gnf;
  Aed? tnd;
  Aed? bob;
  Aed? cny;
  Aed? krw;
  Aed? kwd;
  Aed? dzd;
  Aed? awg;
  Aed? rub;
  Aed? dkk;
  Aed? gbp;
  Aed? twd;
  Aed? cad;
  Aed? fjd;
  Aed? xpf;
  Aed? pen;
  Aed? clp;
  Aed? egp;
  Aed? mkd;
  Aed? bdt;
  Aed? sgd;
  Aed? etb;
  Aed? bsd;
  Aed? tmt;
  Aed? ang;
  Aed? zmw;
  Aed? hnl;
  Aed? mad;
  Aed? npr;
  Aed? xcd;
  Aed? omr;
  Aed? hkd;
  Aed? pyg;
  Aed? mdl;
  Aed? kgs;
  Aed? mur;
  Aed? btn;
  Aed? inr;
  Aed? yer;
  Aed? imp;
  Aed? dop;
  Aed? ggp;
  Aed? lrd;
  Aed? zwl;
  Aed? ugx;
  Aed? vuv;
  Aed? ils;
  Aed? jod;
  Aed? pkr;
  Aed? bnd;
  Aed? aed;
  Aed? gel;
  Aed? scr;
  Aed? fkp;
  Aed? gip;
  Aed? sbd;
  Aed? uzs;
  Aed? mnt;
  Aed? gyd;
  Bam? bam;
  Aed? top;
  Aed? rwf;
  Aed? bgn;
  Aed? ngn;
  Aed? shp;
  Aed? fok;
  Aed? lsl;
  Aed? zar;
  Aed? cve;
  Aed? kpw;
  Aed? cuc;
  Aed? cup;
  Aed? srd;
  Aed? nzd;
  Aed? mxn;
  Aed? php;
  Aed? sek;
  Aed? jmd;
  Aed? ves;
  Aed? jep;
  Aed? afn;
  Aed? mop;
  Aed? syp;
  Aed? stn;
  Aed? chf;
  Aed? szl;
  Aed? myr;
  Aed? pln;
  Aed? ssp;
  Aed? khr;
  Aed? lkr;
  Aed? ghs;
  Aed? ern;
  Aed? bzd;
  Aed? ttd;
  Aed? ckd;
  Aed? mzn;
  Aed? irr;
  Aed? cdf;
  Aed? mvr;
  Aed? mru;
  Aed? czk;
  Aed? byn;
  Aed? all;
  Aed? mwk;
  Aed? sos;
  Aed? rsd;
  Aed? isk;
  Aed? wst;
  Aed? mmk;
  Aed? thb;
  Aed? lbp;
  Aed? kzt;
  Aed? tvd;
  Aed? huf;
  Aed? nok;
  Aed? kmf;
  Bam? sdg;
  Aed? amd;
  Aed? uyu;
  Aed? sar;
  Aed? bif;
  Aed? uah;
  Aed? sll;
  Aed? bmd;
  Aed? nad;
  Aed? htg;
  Aed? lyd;
  Aed? pgk;
  Aed? aoa;
  Aed? idr;
  Aed? ars;
  Aed? pab;
  Aed? jpy;
  Aed? nio;
  Aed? tzs;
  Aed? tjs;
  Aed? gtq;
  Aed? bhd;
  Aed? mga;
  Aed? djf;
  Aed? gmd;
  Aed? bwp;
  Aed? currenciesTry;
  Aed? azn;
  Aed? crc;
  Aed? vnd;
  Aed? hrk;
  Aed? qar;
  Aed? cop;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        hrk: json["HRK"] == null ? null : Aed.fromJson(json["HRK"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
      );

  Map<String, dynamic> toJson() => {
        "BBD": bbd == null ? null : bbd!.toJson(),
        "USD": usd == null ? null : usd!.toJson(),
        "XAF": xaf == null ? null : xaf!.toJson(),
        "BRL": brl == null ? null : brl!.toJson(),
        "EUR": eur == null ? null : eur!.toJson(),
        "AUD": aud == null ? null : aud!.toJson(),
        "KID": kid == null ? null : kid!.toJson(),
        "RON": ron == null ? null : ron!.toJson(),
        "LAK": lak == null ? null : lak!.toJson(),
        "XOF": xof == null ? null : xof!.toJson(),
        "IQD": iqd == null ? null : iqd!.toJson(),
        "KES": kes == null ? null : kes!.toJson(),
        "KYD": kyd == null ? null : kyd!.toJson(),
        "GNF": gnf == null ? null : gnf!.toJson(),
        "TND": tnd == null ? null : tnd!.toJson(),
        "BOB": bob == null ? null : bob!.toJson(),
        "CNY": cny == null ? null : cny!.toJson(),
        "KRW": krw == null ? null : krw!.toJson(),
        "KWD": kwd == null ? null : kwd!.toJson(),
        "DZD": dzd == null ? null : dzd!.toJson(),
        "AWG": awg == null ? null : awg!.toJson(),
        "RUB": rub == null ? null : rub!.toJson(),
        "DKK": dkk == null ? null : dkk!.toJson(),
        "GBP": gbp == null ? null : gbp!.toJson(),
        "TWD": twd == null ? null : twd!.toJson(),
        "CAD": cad == null ? null : cad!.toJson(),
        "FJD": fjd == null ? null : fjd!.toJson(),
        "XPF": xpf == null ? null : xpf!.toJson(),
        "PEN": pen == null ? null : pen!.toJson(),
        "CLP": clp == null ? null : clp!.toJson(),
        "EGP": egp == null ? null : egp!.toJson(),
        "MKD": mkd == null ? null : mkd!.toJson(),
        "BDT": bdt == null ? null : bdt!.toJson(),
        "SGD": sgd == null ? null : sgd!.toJson(),
        "ETB": etb == null ? null : etb!.toJson(),
        "BSD": bsd == null ? null : bsd!.toJson(),
        "TMT": tmt == null ? null : tmt!.toJson(),
        "ANG": ang == null ? null : ang!.toJson(),
        "ZMW": zmw == null ? null : zmw!.toJson(),
        "HNL": hnl == null ? null : hnl!.toJson(),
        "MAD": mad == null ? null : mad!.toJson(),
        "NPR": npr == null ? null : npr!.toJson(),
        "XCD": xcd == null ? null : xcd!.toJson(),
        "OMR": omr == null ? null : omr!.toJson(),
        "HKD": hkd == null ? null : hkd!.toJson(),
        "PYG": pyg == null ? null : pyg!.toJson(),
        "MDL": mdl == null ? null : mdl!.toJson(),
        "KGS": kgs == null ? null : kgs!.toJson(),
        "MUR": mur == null ? null : mur!.toJson(),
        "BTN": btn == null ? null : btn!.toJson(),
        "INR": inr == null ? null : inr!.toJson(),
        "YER": yer == null ? null : yer!.toJson(),
        "IMP": imp == null ? null : imp!.toJson(),
        "DOP": dop == null ? null : dop!.toJson(),
        "GGP": ggp == null ? null : ggp!.toJson(),
        "LRD": lrd == null ? null : lrd!.toJson(),
        "ZWL": zwl == null ? null : zwl!.toJson(),
        "UGX": ugx == null ? null : ugx!.toJson(),
        "VUV": vuv == null ? null : vuv!.toJson(),
        "ILS": ils == null ? null : ils!.toJson(),
        "JOD": jod == null ? null : jod!.toJson(),
        "PKR": pkr == null ? null : pkr!.toJson(),
        "BND": bnd == null ? null : bnd!.toJson(),
        "AED": aed == null ? null : aed!.toJson(),
        "GEL": gel == null ? null : gel!.toJson(),
        "SCR": scr == null ? null : scr!.toJson(),
        "FKP": fkp == null ? null : fkp!.toJson(),
        "GIP": gip == null ? null : gip!.toJson(),
        "SBD": sbd == null ? null : sbd!.toJson(),
        "UZS": uzs == null ? null : uzs!.toJson(),
        "MNT": mnt == null ? null : mnt!.toJson(),
        "GYD": gyd == null ? null : gyd!.toJson(),
        "BAM": bam == null ? null : bam!.toJson(),
        "TOP": top == null ? null : top!.toJson(),
        "RWF": rwf == null ? null : rwf!.toJson(),
        "BGN": bgn == null ? null : bgn!.toJson(),
        "NGN": ngn == null ? null : ngn!.toJson(),
        "SHP": shp == null ? null : shp!.toJson(),
        "FOK": fok == null ? null : fok!.toJson(),
        "LSL": lsl == null ? null : lsl!.toJson(),
        "ZAR": zar == null ? null : zar!.toJson(),
        "CVE": cve == null ? null : cve!.toJson(),
        "KPW": kpw == null ? null : kpw!.toJson(),
        "CUC": cuc == null ? null : cuc!.toJson(),
        "CUP": cup == null ? null : cup!.toJson(),
        "SRD": srd == null ? null : srd!.toJson(),
        "NZD": nzd == null ? null : nzd!.toJson(),
        "MXN": mxn == null ? null : mxn!.toJson(),
        "PHP": php == null ? null : php!.toJson(),
        "SEK": sek == null ? null : sek!.toJson(),
        "JMD": jmd == null ? null : jmd!.toJson(),
        "VES": ves == null ? null : ves!.toJson(),
        "JEP": jep == null ? null : jep!.toJson(),
        "AFN": afn == null ? null : afn!.toJson(),
        "MOP": mop == null ? null : mop!.toJson(),
        "SYP": syp == null ? null : syp!.toJson(),
        "STN": stn == null ? null : stn!.toJson(),
        "CHF": chf == null ? null : chf!.toJson(),
        "SZL": szl == null ? null : szl!.toJson(),
        "MYR": myr == null ? null : myr!.toJson(),
        "PLN": pln == null ? null : pln!.toJson(),
        "SSP": ssp == null ? null : ssp!.toJson(),
        "KHR": khr == null ? null : khr!.toJson(),
        "LKR": lkr == null ? null : lkr!.toJson(),
        "GHS": ghs == null ? null : ghs!.toJson(),
        "ERN": ern == null ? null : ern!.toJson(),
        "BZD": bzd == null ? null : bzd!.toJson(),
        "TTD": ttd == null ? null : ttd!.toJson(),
        "CKD": ckd == null ? null : ckd!.toJson(),
        "MZN": mzn == null ? null : mzn!.toJson(),
        "IRR": irr == null ? null : irr!.toJson(),
        "CDF": cdf == null ? null : cdf!.toJson(),
        "MVR": mvr == null ? null : mvr!.toJson(),
        "MRU": mru == null ? null : mru!.toJson(),
        "CZK": czk == null ? null : czk!.toJson(),
        "BYN": byn == null ? null : byn!.toJson(),
        "ALL": all == null ? null : all!.toJson(),
        "MWK": mwk == null ? null : mwk!.toJson(),
        "SOS": sos == null ? null : sos!.toJson(),
        "RSD": rsd == null ? null : rsd!.toJson(),
        "ISK": isk == null ? null : isk!.toJson(),
        "WST": wst == null ? null : wst!.toJson(),
        "MMK": mmk == null ? null : mmk!.toJson(),
        "THB": thb == null ? null : thb!.toJson(),
        "LBP": lbp == null ? null : lbp!.toJson(),
        "KZT": kzt == null ? null : kzt!.toJson(),
        "TVD": tvd == null ? null : tvd!.toJson(),
        "HUF": huf == null ? null : huf!.toJson(),
        "NOK": nok == null ? null : nok!.toJson(),
        "KMF": kmf == null ? null : kmf!.toJson(),
        "SDG": sdg == null ? null : sdg!.toJson(),
        "AMD": amd == null ? null : amd!.toJson(),
        "UYU": uyu == null ? null : uyu!.toJson(),
        "SAR": sar == null ? null : sar!.toJson(),
        "BIF": bif == null ? null : bif!.toJson(),
        "UAH": uah == null ? null : uah!.toJson(),
        "SLL": sll == null ? null : sll!.toJson(),
        "BMD": bmd == null ? null : bmd!.toJson(),
        "NAD": nad == null ? null : nad!.toJson(),
        "HTG": htg == null ? null : htg!.toJson(),
        "LYD": lyd == null ? null : lyd!.toJson(),
        "PGK": pgk == null ? null : pgk!.toJson(),
        "AOA": aoa == null ? null : aoa!.toJson(),
        "IDR": idr == null ? null : idr!.toJson(),
        "ARS": ars == null ? null : ars!.toJson(),
        "PAB": pab == null ? null : pab!.toJson(),
        "JPY": jpy == null ? null : jpy!.toJson(),
        "NIO": nio == null ? null : nio!.toJson(),
        "TZS": tzs == null ? null : tzs!.toJson(),
        "TJS": tjs == null ? null : tjs!.toJson(),
        "GTQ": gtq == null ? null : gtq!.toJson(),
        "BHD": bhd == null ? null : bhd!.toJson(),
        "MGA": mga == null ? null : mga!.toJson(),
        "DJF": djf == null ? null : djf!.toJson(),
        "GMD": gmd == null ? null : gmd!.toJson(),
        "BWP": bwp == null ? null : bwp!.toJson(),
        "TRY": currenciesTry == null ? null : currenciesTry!.toJson(),
        "AZN": azn == null ? null : azn!.toJson(),
        "CRC": crc == null ? null : crc!.toJson(),
        "VND": vnd == null ? null : vnd!.toJson(),
        "HRK": hrk == null ? null : hrk!.toJson(),
        "QAR": qar == null ? null : qar!.toJson(),
        "COP": cop == null ? null : cop!.toJson(),
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

  Eng eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
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

  String? root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? null
            : List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes == null
            ? null
            : List<dynamic>.from(suffixes!.map((x) => x)),
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

class Name {
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  String common;
  String official;
  Map<String, Translation>? nativeName;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null
            ? null
            : Map.from(json["nativeName"]).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName == null
            ? null
            : Map.from(nativeName!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  PostalCode({
    required this.format,
    required this.regex,
  });

  String format;
  String regex;

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { AMERICAS, AFRICA, EUROPE, OCEANIA, ASIA, ANTARCTIC }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SUNDAY, SATURDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
