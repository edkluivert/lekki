import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lekki/data/api/get_house_api.dart';
import 'package:lekki/data/model/house.dart';
import 'package:lekki/data/repository/get_house_repo.dart';


class HomeController extends GetxController with StateMixin<House>{

  final GetHouseRepo _getHouseRepo = GetHouseRepo();



  @override
  void onInit() {
    super.onInit();
    _getHouseRepo.getHouses().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }


}