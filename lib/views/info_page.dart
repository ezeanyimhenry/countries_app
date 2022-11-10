import 'package:countries_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:countries_app/model/country_info_model.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:countries_app/app_bar.dart';

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

  void _getData() async {
    _countryInfoModel = (await ApiService().getCountry(country))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    _countryInfoModel!.sort((a, b) => a.name.common.compareTo(b.name.common));
    return Scaffold(
      appBar: myAppBar("Test"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        // controller: controller,
                        decoration: InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        // onChanged: onSearchTextChanged,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          // controller.clear();
                          // onSearchTextChanged('');
                        },
                      ),
                    ),
                  ),
                ),
              ),
              _countryInfoModel == null || _countryInfoModel!.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                      // child: Text('its null'),
                    )
                  : Container(
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        child: Image.network(
                                          _countryInfoModel![index].flags.png,
                                          height: 50.0,
                                          width: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(_countryInfoModel![index]
                                              .name
                                              .common),
                                          Text(_countryInfoModel![index]
                                              .capital),
                                        ],
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
