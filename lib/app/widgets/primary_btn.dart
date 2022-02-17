import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lekki/app/config/app_color.dart';

class PrimaryButton extends StatelessWidget{
  final String text;
  final VoidCallback? onClick;

  const PrimaryButton({
    required this.text,
    required this.onClick,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: 320.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onClick,
        style:  ElevatedButton.styleFrom(
          //elevation: 10,
          //shadowColor: wPrimaryColorDark,
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(55.r), // <-- Radius
            ),
           // textStyle: AppTextStyles.btnText
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
