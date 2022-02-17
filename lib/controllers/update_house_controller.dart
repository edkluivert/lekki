import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lekki/data/api/add_house_api.dart';
import 'package:lekki/data/api/get_house_api.dart';
import 'package:lekki/data/repository/update_house_repo.dart';

import '../data/model/house.dart';

class UpdateHouseController extends GetxController {

  var bedRoom = '';
  var kitchen = '';
  var bathRoom = '';
  var toilet = '';
  var description = '';
  var validTo = '';
  var sittingRoom = '';

  final AddHouseApi addHouseApi = AddHouseApi();

  final UpdateHouseRepo updateHouseRepo = UpdateHouseRepo();

  late TextEditingController bathRoomController, kitchenController,toiletController,
  descriptionController,validToController, bedRoomController,sittingRoomController;


  @override
  void onInit() {

    super.onInit();
   bathRoomController = TextEditingController();
   kitchenController = TextEditingController();
   sittingRoomController = TextEditingController();
   descriptionController =TextEditingController();
   validToController =  TextEditingController();
   toiletController = TextEditingController();
   bedRoomController = TextEditingController();


  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    bedRoomController.dispose();
    bathRoomController.dispose();
    kitchenController.dispose();
    validToController.dispose();
    toiletController.dispose();
    sittingRoomController.dispose();
    descriptionController.dispose();

  }
  String? validateBathRoom(String value) {
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

  String? validateToilet(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
  String? validateDescription(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
  String? validateBedRoom(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
  String? validateKitchen(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
  String? validateValidTo(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }

  Future updateHouse(Data data) async {
     updateHouseRepo.updateHouse(data);
  }

}