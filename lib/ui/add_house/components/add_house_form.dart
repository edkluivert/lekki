import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lekki/controllers/add_house_controller.dart';

import 'package:lekki/data/api/add_house_api.dart';
import '../../../app/config/app_color.dart';
import '../../../app/config/app_text_style.dart';
import '../../../app/widgets/keyboard.dart';
import '../../../app/widgets/primary_btn.dart';

class AddHouseForm extends StatefulWidget{

  @override
  State<AddHouseForm> createState() => _AddHouseFormState();
}

class _AddHouseFormState extends State<AddHouseForm> {
  final AddHouseController _controller = Get.find<AddHouseController>();

  final _formKey = GlobalKey<FormState>();


  bool _btnEnabled = false;
  var _storedImage;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    Map data = {
      'address': _controller.addressController.text.toString(),
      'type': _controller.typeController.text.toString(),
      'bedroom': _controller.bedRoomController.text.toString(),
      'sittingRoom': _controller.sittingRoomController.text.toString(),
      'kitchen': _controller.kitchenController.text.toString(),
      'bathroom': _controller.bathRoomController.text.toString(),
      'toilet': _controller.toiletController.text.toString(),
      'propertyOwner': _controller.propertyOwnerController.text.toString(),
      'description': _controller.descriptionController.text.toString(),
      'validFrom': DateFormat("dd-MM-yyyy")
        .format(_controller.dateRange.value.end)
        .toString(),
      'validTo':DateFormat("dd-MM-yyyy")
          .format(_controller.dateRange.value.end)
          .toString(),
      'images': _controller.data.images
    };
   return Form(
     key: _formKey,
     onChanged: () =>
         setState(() => _formKey.currentState!.validate()),
     autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
     child: Column(
       children: [
         buildSittingRoomField(),
         SizedBox(height: 10.h,),
         buildBedRoomField(),
         SizedBox(height: 10.h,),
         buildBathRoomField(),
         SizedBox(height: 10.h,),
         buildDescriptionField(),
         SizedBox(height: 10.h,),
         buildToiletField(),
         SizedBox(height: 10.h,),
         buildTypeField(),
         SizedBox(height: 10.h,),
         buildAddressField(),
         SizedBox(height: 10.h,),
         buildPropertyOwnerField(),
         SizedBox(height: 10.h,),
         buildKitchenField(),
         SizedBox(height: 10.h,),
         Obx(()=> _myDate(date: DateFormat("dd-MM-yyyy")
             .format(_controller.dateRange.value.start)
             .toString(), onClick: (){
           _controller.chooseDateRangePicker();
         })),
         SizedBox(height: 16.h,),
         Obx(()=> _myDate(date: DateFormat("dd-MM-yyyy")
             .format(_controller.dateRange.value.end)
             .toString(), onClick: (){
           _controller.chooseDateRangePicker();
         })),
         SizedBox(height: 10.h,),

           PrimaryButton(text: "Update", onClick: (){
             if (_formKey.currentState!.validate()) {
               _formKey.currentState!.save();
               // if all are valid then go to success screen
               KeyboardUtil.hideKeyboard(context);
               _controller.addHouse(data);
             }else{
               Get.snackbar(
                 "Attention",
                 "Please complete the form",
               );
             }
           }),
         SizedBox(height: 20.h,),
       ],
     ),
   );
  }

  Widget _myDate({required String date, required Function onClick}){
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Padding(
        padding:  EdgeInsets.only(left: 27.w, right: 27.w),
        child: SizedBox(
          width: 320.w,
          height: 56.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: AppTextStyle.houseTypeText,),
                 const Icon(Icons.calendar_today),
                ],
              ),
              SizedBox(height: 19.h,),
              Divider(
                color: Colors.black.withOpacity(0.8),
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildBedRoomField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: AppTextStyle.houseTypeText,
      controller: _controller.bedRoomController,
      onSaved: (value) {
        _controller.bedRoom = value!;
      },
      validator: (value) {
        return _controller.validateBedRoom(value!);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Bedroom", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildBathRoomField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style:  AppTextStyle.houseTypeText,
      controller: _controller.bathRoomController,
      onSaved: (value) {
        _controller.bathRoom = value!;
      },
      validator: (value) {
        return _controller.validateBathRoom(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Bathroom", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }

  TextFormField buildSittingRoomField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style:  AppTextStyle.houseTypeText,
      controller: _controller.sittingRoomController,
      onSaved: (value) {
        _controller.sittingRoom = value!;
      },
      validator: (value) {
        return _controller.validateSittingRoom(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Sitting room", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }

  TextFormField buildKitchenField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style:AppTextStyle.houseTypeText ,
      controller: _controller.kitchenController,
      onSaved: (value) {
        _controller.kitchen = value!;
      },
      validator: (value) {
        return _controller.validateKitchen(value!);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Kitchen", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildToiletField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: AppTextStyle.houseTypeText,
      controller: _controller.toiletController,
      onSaved: (value) {
        _controller.toilet = value!;
      },
      validator: (value) {
        return _controller.validateToilet(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Toilet", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: AppTextStyle.houseTypeText,
      controller: _controller.descriptionController,
      onSaved: (value) {
        _controller.description = value!;
      },
      validator: (value) {
        return _controller.validateDescription(value!);
      },

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Description", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTypeField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style:AppTextStyle.houseTypeText,
      controller: _controller.typeController,
      onSaved: (value) {
        _controller.type= value!;
      },
      validator: (value) {
        return _controller.validateType(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Type", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style:AppTextStyle.houseTypeText,
      controller: _controller.addressController,
      onSaved: (value) {
        _controller.address= value!;
      },
      validator: (value) {
        return _controller.validateAddress(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Address", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }



  TextFormField buildPropertyOwnerField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style:AppTextStyle.houseTypeText,
      controller: _controller.propertyOwnerController,
      onSaved: (value) {
        _controller.propertyOwner= value!;
      },
      validator: (value) {
        return _controller.validatePropertyOwner(value!);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),

        ),
        label: Text("Property Owner", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}