import 'package:countries_app/views/info_page.dart';
import 'package:flutter/material.dart';
import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:countries_app/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CountryModel>? _countryModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _countryModel = (await ApiService().getCountries())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    _countryModel!.sort((a, b) => a.name.common.compareTo(b.name.common));
    return Scaffold(
      appBar: myAppBar("Home"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      // controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Search Country', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
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
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.language_outlined),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("EN"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt_outlined),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("filter"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              _countryModel == null || _countryModel!.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                      // child: Text('its null'),
                    )
                  : Container(
                      height: 1000,
                      child: SafeArea(
                        child: _searchResult.length != 0
                            ? ListView.builder(
                                itemCount: _searchResult.length,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Info(
                                            _searchResult![i].name.common);
                                      }));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              child: Image.network(
                                                _searchResult![i].flags.png,
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
                                                Text(_searchResult![i]
                                                    .name
                                                    .common),
                                                Text(_searchResult![i].capital),
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
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: _countryModel!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Info(
                                            _countryModel![index].name.common);
                                      }));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              child: Image.network(
                                                _countryModel![index].flags.png,
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
                                                Text(_countryModel![index]
                                                    .name
                                                    .common),
                                                Text(_countryModel![index]
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

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _countryModel!.forEach((userDetail) {
      if (userDetail.name.common.contains(text) ||
          userDetail.capital.contains(text)) _searchResult.add(userDetail);
    });
    setState(() {});
  }
}

List<CountryModel> _searchResult = [];
