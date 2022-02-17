
import 'dart:convert';

import 'package:lekki/app/config/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:lekki/data/model/house.dart';

class GetHouseApi{
  static var client = http.Client();

  static var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future getHouses() async{

    final Uri uri = Uri.parse(AppConstants.baseUrl+"/lekki/property");
    try{
      var response = await client.get(uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode <= 300) {
        print("works");
        print(body);
        print(statusCode);
        return body;
      } else {
        print(body);
        print(statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

  static Future<House?> getHousesNew() async{

    final Uri uri = Uri.parse(AppConstants.baseUrl+"/lekki/property");
      var response = await client.get(uri, headers: headers);
      if (response.statusCode <= 300) {
        print("works");
        var jsn = response.body;
        return House.fromJson(jsonDecode(jsn));
      } else {
       return null;
      }
    }


  Future filteredHouses({
    required final int sitting,
    required final int kitchen,
  }) async {
    print("working");
    print(sitting);
    print(kitchen);

    final Uri uri = Uri.parse(
        "${AppConstants.baseUrl}/lekki/property?kitchen=$kitchen&sittingRoom=$sitting");

    try {
      final http.Response response = await client.get(uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      print("folA");
      if (statusCode <= 300) {
        print("folaaaaaaaaaaaaa");
        print(body);
        print(statusCode);
        return body;
      } else {
        print(body);
        print(statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
