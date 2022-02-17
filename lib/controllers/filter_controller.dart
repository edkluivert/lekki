import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/house.dart';
import '../data/repository/get_house_repo.dart';

class FilterController extends GetxController with StateMixin<House>{
  var kitchen = '';
  var sittingRoom = '';
  var data = <Data>[].obs;
  final GetHouseRepo _getHouseRepo = GetHouseRepo();
  late TextEditingController sittingRoomController, kitchenController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    kitchenController = TextEditingController();
    sittingRoomController  = TextEditingController();
  }

  @override
  void onClose() {
    kitchenController.dispose();
    sittingRoomController.dispose();

  }

  void filterHouse({required int kitchen, required int sittingRoom})
  {
    _getHouseRepo.filterHouses(sitting: sittingRoom, kitchen: kitchen).then((value) => {
      //data.value = value.data,
      change(value, status: RxStatus.success())
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }


  String? validateKitchen(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }

  String? validateSittingRoom(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
}