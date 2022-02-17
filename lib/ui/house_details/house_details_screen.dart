import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lekki/app/config/app_text_style.dart';
import 'package:lekki/data/model/house.dart';
import 'package:lekki/ui/update_house/update_house_screen.dart';

import 'components/image_slider.dart';

class HouseDetailsScreen extends StatefulWidget{

  final Data data;
 HouseDetailsScreen({Key? key, required this.data }) : super(key: key);

  @override
  State<HouseDetailsScreen> createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {

  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,viewportFraction: 1.05,
  );


  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Text('Edit', style:  AppTextStyle.fabText,),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateHouseScreen(data: widget.data,)));
        },
      ),
    backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 114.h,
                child: PageView.builder(
                    itemBuilder: (context, index) {
                      return Opacity(
                        opacity: currentPage == index ? 1.0 : 0.8,
                        child: ImageSlide(
                          currentPage: currentPage,
                          index: index,
                          data: widget.data,
                        ),
                      );
                    },
                    itemCount: widget.data.images!.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                      print("hello $index");
                    }),
              ),
              Text(widget.data.type),
              SizedBox(height: 5.h,),
              Text(widget.data.address),
              SizedBox(height: 5.h,),
              Text(widget.data.description),
              SizedBox(height: 5.h,),
              Text(widget.data.bathroom.toString()),
              SizedBox(height: 5.h,),
              Text(widget.data.propertyOwner),
              SizedBox(height: 5.h,),
              Text(widget.data.validFrom),
              SizedBox(height: 5.h,),
              Text(widget.data.validTo),
              SizedBox(height: 5.h,),
              Text(widget.data.kitchen.toString()),
            ],
          ),
        ),
      ),
    );
  }


}