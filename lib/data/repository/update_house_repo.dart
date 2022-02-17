import 'package:get/get.dart';
import 'package:lekki/data/api/add_house_api.dart';

import '../model/house.dart';

class UpdateHouseRepo extends GetConnect{

  final AddHouseApi addHouseApi = AddHouseApi();

   Future<Response> updateHouse(Map data, String id) async{
     var response = await post("https://sfc-lekki-property.herokuapp.com/api/v1/lekki/property/$id",data);
    return response.body;
   }


}