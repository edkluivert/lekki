import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lekki/app/config/app_color.dart';
import 'package:lekki/app/config/app_text_style.dart';
import 'package:lekki/app/widgets/primary_btn.dart';
import 'package:lekki/controllers/update_house_controller.dart';

import '../../../app/widgets/keyboard.dart';
import '../../controllers/update_house_controller.dart';
import '../../data/model/house.dart';

class UpdateHouseScreen extends StatefulWidget{
  final Data data;
   const UpdateHouseScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdateHouseScreen> createState() => _UpdateHouseScreenState();
}

class _UpdateHouseScreenState extends State<UpdateHouseScreen> {

  final UpdateHouseController _controller = Get.find<UpdateHouseController>();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool _btnEnabled = false;
    bool _autoValidate = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(child: SingleChildScrollView(
        child: Form(
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
              buildValidToField(),
              SizedBox(height: 10.h,),
              buildKitchenField(),
              SizedBox(height: 10.h,),
              PrimaryButton(text: "Update", onClick: (){
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  Map data = {
                    "bedroom":  _controller.bedRoomController.text,
                    "sittingRoom": _controller.sittingRoomController.text,
                    "kitchen": _controller.kitchenController.text,
                    "bathroom": _controller.bathRoomController.text,
                    "toilet":  _controller.toiletController.text,
                    "description": _controller.descriptionController.text,
                    "validTo": _controller.validToController.text,
                    "id":widget.data.id.toString()
                  };
                  _controller.updateHouse(data, widget.data.id.toString());

                }else{
                  Get.snackbar(
                    "Attention",
                    "Please complete the form",
                  );
                }
              })
            ],
          ),
        ),
      ) ),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.bedroom.toString(),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.bathroom.toString(),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.sittingRoom.toString(),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.kitchen.toString(),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.toilet.toString(),
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.description,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildValidToField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      style:AppTextStyle.houseTypeText,
      controller: _controller.validToController,
      onSaved: (value) {
        _controller.validTo = value!;
      },
      validator: (value) {
        return _controller.validateValidTo(value!);
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
        hintStyle: AppTextStyle.hintText,
        hintText: widget.data.validTo.toString(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}