import 'dart:convert';

import 'package:get/get.dart';

import '../../app/config/app_constants.dart';
import '../api/get_house_api.dart';
import '../model/house.dart';

class GetHouseRepo extends GetConnect{

  final GetHouseApi getHouseApi = GetHouseApi();

  Future<House> getHouses() async{

    var response = await get("https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property");
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{

      return House.fromJson(response.body);
    }

  }

  Future<House> filterHouses({required final int sitting,
     required final int kitchen,}) async{
    var response = await get ("https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property?kitchen=$kitchen&sittingRoom=$sitting");
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{

      return House.fromJson(response.body);
    }
  }
  //   try {
  //     var response =
  //     await getHouseApi.filteredHouses(sitting: sitting, kitchen: kitchen);
  //
  //     var data = House.fromJson(jsonDecode(response));
  //
  //     var postCode = data.status;
  //     var postData = data.data;
  //     if (postCode == "success") {
  //
  //       return postData;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}