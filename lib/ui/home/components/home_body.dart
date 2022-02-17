import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lekki/app/widgets/primary_btn.dart';
import 'package:lekki/controllers/home_controller.dart';
import 'package:lekki/data/model/house.dart';
import 'package:lekki/data/repository/get_house_repo.dart';
import 'package:lekki/ui/home/components/house_item.dart';
import 'package:shimmer/shimmer.dart';

class HomeBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:controller.obx((data) =>
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return HouseItem(data: data!.data[index],index: index,);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 16.w,
                );
              },
              itemCount: data!.data.length),
        )
    )
    );
  }
}