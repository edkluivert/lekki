import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lekki/app/config/app_constants.dart';

class AddHouseApi {
  final client = http.Client();
  List<dynamic> data = [];
  Future addHouse(data) async {
    http.Response saveResponse = await
    http.post(Uri.parse('https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));
    if (saveResponse.statusCode == 201) {
      return true;
    } else {
      print(false);
    }
  }


  Future uploadImage(fileName) async {
    var imageRequest =
    await http.MultipartRequest('POST', Uri.parse("https://sfc-lekki-property.herokuapp.com/api/v1/lekki/upload/"));
    imageRequest.files.add(await http.MultipartFile.fromPath('file', fileName));

    http.StreamedResponse imageResponse = await imageRequest.send();
    return imageResponse;
  }



  Future updateHouse({
    required String bedroom,
    required String sittingroom,
    required String kitchen,
    required String bathroom,
    required String toilet,

    required String description,

    required String validto,
    required String id,
  }) async {
    final Uri uri = Uri.parse("https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property/$id");
    print(uri);
    final http.Response response = await client.patch(uri,
        body: jsonEncode({

          "bedroom": bedroom,
          "sittingRoom": sittingroom,
          "kitchen": kitchen,
          "bathroom": bathroom,
          "toilet": toilet,
          "description": description,
          "validTo": validto,
          "images": data,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
    final statusCode = response.statusCode;
    final body = response.body;

    //   print(data);
    if (statusCode <= 300) {
      print(body);
      //  print(message);
      print(statusCode);

      return body;
    } else {
      //print(message);
      print(statusCode);
      print(body);
    }
  }

}