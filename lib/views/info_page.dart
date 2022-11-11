import 'package:flutter/material.dart';
import 'package:countries_app/model/country_info_model.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:countries_app/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

class Info extends StatefulWidget {
  final String country;
  const Info(this.country, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InfoState createState() => _InfoState(country);
}

class _InfoState extends State<Info> {
  late List<CountryInfoModel>? _countryInfoModel = [];
  String country;
  _InfoState(this.country);

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getLang() async {
    _countryInfoModel = (await ApiService().getCountry(country))!;

    var languages = _countryInfoModel![0].languages;
    List jsonObjects = [];
    String countryLang = "";

    if (_countryInfoModel![0].languages != null) {
      for (final name in languages!.keys) {
        final value = languages[name];
        jsonObjects.add(value);
      }
    } else {
      jsonObjects.add("No item");
    }
    countryLang = jsonObjects[0];
    return countryLang;
  }

  _getData() async {
    _countryInfoModel = (await ApiService().getCountry(country))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    String title = country;
    _countryInfoModel!.sort((a, b) => a.name.common.compareTo(b.name.common));

    return Scaffold(
      appBar: myAppBar(title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _countryInfoModel == null || _countryInfoModel!.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                      // child: Text('its null'),
                    )
                  : SizedBox(
                      height: 1000,
                      child: SafeArea(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _countryInfoModel!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CarouselSlider(
                                    items: [
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                _countryInfoModel![index]
                                                    .flags
                                                    .png),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                _countryInfoModel![index]
                                                    .coatOfArms
                                                    .png),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      height: 200.0,
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      viewportFraction: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Population:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].population,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Region:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].region!,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Sub Region:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index]
                                            .subregion
                                            .toString(),
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Capital:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].capital[0],
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Official Language:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      FutureBuilder(
                                          future: _getLang(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData)
                                              return new Container();
                                            String content = snapshot.data!;
                                            return new Text(
                                              content,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16.0),
                                            );
                                          })
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Continent:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].continents[0],
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Religion:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].name.common,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Government:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].name.common,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Independence:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].independent
                                            ? "Independent"
                                            : "Not Independent",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Area:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].area,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("UN Member:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index]
                                            .unMember
                                            .toString(),
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("GDP:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].name.common,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Time Zone:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].timezones[0],
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Date Format:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].name.common,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Dailing Code:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].name.common,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Driving Side:",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          )),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _countryInfoModel![index].car!.side ==
                                                null
                                            ? "No Items"
                                            : _countryInfoModel![index]
                                                .car!
                                                .side
                                                .toString(),
                                        style:
                                            GoogleFonts.poppins(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
