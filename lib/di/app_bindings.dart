import 'package:get/get.dart';
import 'package:lekki/controllers/add_house_controller.dart';
import 'package:lekki/controllers/filter_controller.dart';
import 'package:lekki/controllers/home_controller.dart';
import 'package:lekki/controllers/update_house_controller.dart';
import 'package:lekki/data/api/add_house_api.dart';
import 'package:lekki/data/repository/get_house_repo.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(AddHouseController(addHouseApi: AddHouseApi()),permanent: true);
    Get.put(UpdateHouseController(),permanent: true);
    Get.put(FilterController(), permanent: true);
  }

}