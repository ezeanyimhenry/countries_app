import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:countries_app/constants.dart';
import 'package:countries_app/model/country_model.dart';

class ApiService {
  Future<List<CountryModel>?> getCountries() async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.countriesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CountryModel> model = countryModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
