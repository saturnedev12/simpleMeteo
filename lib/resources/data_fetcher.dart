import 'dart:convert';

import 'package:http/http.dart' as http;

class DataFetcher {
  String _url =
      "https://api.openweathermap.org/data/2.5/weather?q=Abidjan&lang=fr&units=metric&appid=7238b3076fe0165bc87626da5166bdd3";
  var client = http.Client();
  fetchData() async {
    try {
      var response = await client.get(Uri.parse(_url));
      return await jsonDecode(response.body);
    } catch (e) {
      print("error get resources: $e");
    }
  }
}
