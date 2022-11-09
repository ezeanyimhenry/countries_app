import 'package:flutter/material.dart';
import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/services/api_service.dart';

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
      appBar: AppBar(
        title: const Text('Countries API Example'),
      ),
      body: _countryModel == null || _countryModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
              // child: Text('its null'),
            )
          : ListView.builder(
              itemCount: _countryModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            _countryModel![index].flags.png,
                            height: 50,
                            width: 50,
                          ),
                          Text(_countryModel![index].name.common),
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
    );
  }
}
