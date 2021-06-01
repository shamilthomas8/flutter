import 'package:http/http.dart';
import 'dart:convert';

class Networkhelper {
  final String url;
  Networkhelper(this.url);

  Future getData() async {
    Response response = await get(url);
    print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return (decodedData);
    } else {
      print(response.statusCode);
    }
  }
}
