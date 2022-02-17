import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lekki/app/widgets/primary_btn.dart';
import 'package:lekki/controllers/filter_controller.dart';
import 'package:lekki/controllers/home_controller.dart';

import '../../app/config/app_color.dart';
import '../../app/config/app_text_style.dart';
import '../home/components/house_item.dart';

class FilterScreen extends GetView<FilterController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSittingRoomField(),
          SizedBox(height: 10.h,),
          buildKitchenField(),
          SizedBox(height: 20.h,),
      PrimaryButton(text: "Search", onClick: controller.sittingRoomController.text.isNotEmpty && controller
      .kitchenController.text.isNotEmpty ? (){
        controller.filterHouse(kitchen: int.parse(controller.kitchenController.text),
            sittingRoom: int.parse(controller.sittingRoomController.text));
      }:null
      ),
      Expanded(
        child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    
                    return HouseItem(data: controller.value!.data[index], index: index,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 16.w,
                    );
                  },
                  itemCount: controller.data.value.length),
            ),
          )
      ]
      ),
    );
  }
  TextFormField buildSittingRoomField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style:  AppTextStyle.houseTypeText,
      controller: controller.sittingRoomController,
      onSaved: (value) {
        controller.sittingRoom = value!;
      },
      validator: (value) {
        return controller.validateSittingRoom(value!);
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
        label: Text("Sitting Room", style: AppTextStyle.hintText,),
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }
  TextFormField buildKitchenField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style:AppTextStyle.houseTypeText ,
      controller: controller.kitchenController,
      onSaved: (value) {
        controller.kitchen = value!;
      },
      validator: (value) {
        return controller.validateKitchen(value!);
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

}