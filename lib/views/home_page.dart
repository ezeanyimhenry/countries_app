import 'package:countries_app/main.dart';
import 'package:countries_app/views/info_page.dart';
import 'package:flutter/material.dart';
import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:countries_app/app_bar.dart';
import 'package:language_builder/language_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:accordion/accordion.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = "EN";
  // String dropdownvalue = LanguageBuilder.getCurrentLang();
  Map<String, dynamic> texts = {};
  // var items = LanguageBuilder.getAvailableLanguages();
  var items = ['en', 'sp'];
  TextEditingController controller = TextEditingController();
  late List<CountryModel>? _countryModel = [];

  final panelController = PanelController();
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
      body: SlidingUpPanel(
        controller: panelController,
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        color: Theme.of(context).backgroundColor,
        minHeight: 0,
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
                      leading: const Icon(Icons.search),
                      title: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            hintText: 'Search Country',
                            border: InputBorder.none),
                        onChanged: onSearchTextChanged,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          controller.clear();
                          onSearchTextChanged('');
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
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
                            // DropdownButton(
                            //   value: dropdownvalue,
                            //   icon: const Icon(Icons.keyboard_arrow_down),
                            //   items: items.map((String items) {
                            //     return DropdownMenuItem(
                            //       value: items,
                            //       child: Text(items),
                            //     );
                            //   }).toList(),
                            //   onChanged: (String? newValue) {
                            //     // var e = 'en';
                            //     if (newValue !=
                            //         LanguageBuilder.getCurrentLang()) {
                            //       LanguageBuilder.changeLanguage(
                            //           newValue!, context);
                            //     }
                            //     setState(() {
                            //       dropdownvalue = newValue!;
                            //     });
                            //   },
                            // ),
                            Text("EN"),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: togglePanel,
                          child: Row(
                            children: const [
                              Icon(Icons.filter_alt_outlined),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("filter"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                _countryModel == null || _countryModel!.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                        // child: Text('its null'),
                      )
                    : SizedBox(
                        height: 1000,
                        child: SafeArea(
                          child: _searchResult.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _searchResult.length,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Info(
                                              _searchResult[i].name.common);
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
                                                  _searchResult[i].flags.png,
                                                  height: 50.0,
                                                  width: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(_searchResult[i]
                                                      .name
                                                      .common),
                                                  Text(_searchResult[i]
                                                      .capital![0]),
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
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Info(_countryModel![index]
                                              .name
                                              .common);
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
                                                  _countryModel![index]
                                                      .flags
                                                      .png,
                                                  height: 50.0,
                                                  width: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(_countryModel![index]
                                                      .name
                                                      .common),
                                                  Text(_countryModel![index]
                                                      .capital![0]),
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
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _countryModel!) {
      if (userDetail.name.common.contains(text) ||
          userDetail.capital!.contains(text)) _searchResult.add(userDetail);
    }
    setState(() {});
  }

  void togglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        SizedBox(
          height: 36,
        ),
        buildLanguageList(),
        SizedBox(height: 24)
      ],
    );
  }

  Widget buildLanguageList() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Accordion(
                headerPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                children: [
                  AccordionSection(
                    header: Text('Continents'),
                    content: Text("List of continents"),
                  ),
                ]),
            Accordion(children: [
              AccordionSection(
                header: Text('Time Zone'),
                content: Text("List of time zones"),
              ),
            ]),
          ],
        ),
      );
}

List<CountryModel> _searchResult = [];
