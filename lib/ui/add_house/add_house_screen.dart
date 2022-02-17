import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lekki/app/widgets/primary_btn.dart';
import 'package:lekki/controllers/add_house_controller.dart';
import 'package:lekki/ui/add_house/components/add_house_form.dart';

import '../../data/api/add_house_api.dart';

class AddHouseScreen extends StatefulWidget{
  const AddHouseScreen({Key? key}) : super(key: key);

  @override
  State<AddHouseScreen> createState() => _AddHouseScreenState();
}

class _AddHouseScreenState extends State<AddHouseScreen> {
  @override
  Widget build(BuildContext context) {
    final AddHouseController addHouseController = Get.find<AddHouseController>();
    var _storedImage;
    final AddHouseApi _addHouseApi = AddHouseApi();

    Future uploadImage(fileName) async {
      http.StreamedResponse imageResponse =
      await _addHouseApi.uploadImage(fileName);

      if (imageResponse.statusCode == 200) {
        dynamic feedback = await imageResponse.stream.bytesToString();
        final decodedJson = jsonDecode(feedback);
        addHouseController .data.images!.add(decodedJson["data"]);


        setState(() {
          _storedImage = decodedJson["data"]["path"];
          Get.snackbar('Hello', 'Works');
          //imagePromptText = "Image added successfully.";
        });
      } else {

      }
    }

    Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(image == null)return;
        var res = await uploadImage(image.path);
      } catch (e) {

        return null;
      }
    }

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
             PrimaryButton(text: 'Pick Image', onClick: (){
               pickImage();
             }),
              SizedBox(height: 20.h,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 10.w),
               child: AddHouseForm(),
             ),

            ],
          ),
        ),
      ),
    );

  }
}
