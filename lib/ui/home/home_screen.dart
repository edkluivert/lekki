import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lekki/app/routes/app_routes.dart';

import 'components/home_body.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lekki task"),
        backgroundColor: Colors.white,
        actions:  [
          GestureDetector(
            onTap: (){
            Get.toNamed(AppRoutes.queryScreen);
            },
              child: Icon(Icons.find_in_page, color: Colors.blue,size: 24,semanticLabel: 'Query houses',)),
          Container(width: 30.w,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
           Get.toNamed(AppRoutes.addScreen);
        },
      ),
      backgroundColor: Colors.white,
      body: HomeBody(),
    );
  }

}