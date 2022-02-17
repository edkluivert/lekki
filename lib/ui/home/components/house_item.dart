import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lekki/app/config/app_text_style.dart';
import 'package:lekki/app/routes/app_routes.dart';
import 'package:lekki/ui/house_details/house_details_screen.dart';

import '../../../data/model/house.dart';

class HouseItem extends StatelessWidget{

  final Data data;
  int index;
  HouseItem({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (){
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) =>
                   HouseDetailsScreen(
                  data: data,
                   )));
     },
     child: Card(
       elevation: 5,
       color: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10.r)
       ),
       child: SizedBox(
         width: 300.w,
         height: 200.h,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             data.images!.isEmpty?const Center(child: CircularProgressIndicator()):
             Container(
               height: 150.h,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.r),
                   image: DecorationImage(
                       image: NetworkImage(data.images![0].path!),
                       fit: BoxFit.cover
                   )
               ),
             ),
             SizedBox(height: 15.h,),
             Text(data.type, style: AppTextStyle.houseTypeText,),
           ],
         ),
       ),
     ),
   );
  }

}
