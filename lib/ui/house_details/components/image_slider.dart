import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/house.dart';

class ImageSlide extends StatelessWidget {
  ImageSlide({required this.data, required this.index, required this.currentPage});

  final Data data;
  int index;
  int currentPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300.w,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
                image: NetworkImage(data.images![index].path!,
                ), fit: BoxFit.cover),
          ),

        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 17 : 6,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(10)
        // shape: BoxShape.circle
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i <= data.images!.length-1; i++) {
      if (currentPage == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}