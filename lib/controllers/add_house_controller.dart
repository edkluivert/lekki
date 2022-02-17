import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lekki/ui/home/home_screen.dart';

import '../data/api/add_house_api.dart';


import '../data/model/house.dart';
class AddHouseController extends GetxController{

  final AddHouseApi _addHouseApi;
  AddHouseController({required AddHouseApi addHouseApi}) : _addHouseApi = addHouseApi;

  Data data = Data('', '', '', 1, 1,
      1, 1, 2, '', '',
      '', '', [], DateTime.now(),  DateTime.now(), 0);



  var bedRoom = '';
  var kitchen = '';
  var bathRoom = '';
  var toilet = '';
  var description = '';
  var address = '';
  var type = '';
  var propertyOwner = '';
  var sittingRoom = '';

  late TextEditingController bathRoomController, kitchenController,toiletController,
  propertyOwnerController, typeController, addressController,
      descriptionController, bedRoomController,sittingRoomController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bathRoomController = TextEditingController();
    kitchenController = TextEditingController();
    addressController = TextEditingController();
    sittingRoomController = TextEditingController();
    descriptionController =TextEditingController();
   sittingRoomController =  TextEditingController();
    toiletController = TextEditingController();
    typeController = TextEditingController();
    propertyOwnerController = TextEditingController();

    bedRoomController = TextEditingController();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    bedRoomController.dispose();
    bathRoomController.dispose();
    kitchenController.dispose();
     typeController.dispose();
     propertyOwnerController.dispose();
     addressController.dispose();
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
  String? validateType(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }

  String? validatePropertyOwner(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }
  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please complete the form";
    }
    return null;
  }







  var dateRange = DateTimeRange(start: DateTime.now(),
    end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 6),
  ).obs;

  chooseDateRangePicker()async{
    DateTimeRange? picked = await
    showDateRangePicker(context: Get.context!,
        firstDate: DateTime(DateTime.now().year-20),
        lastDate: DateTime(DateTime.now().year+20),
        initialDateRange: dateRange.value,
        builder: (context,child){
          return Theme(data: ThemeData.light(), child: child!)
        }
    );
    if(picked!=null && picked != dateRange.value){
      dateRange.value = picked;
    }
  }


  Future addHouse(datay) async {
         var data = await _addHouseApi.addHouse(datay);
         if(data != null){
           Get.snackbar('Hello', 'works');
         }else{
           Get.snackbar('Hello', 'works nit');
         }

  }


}