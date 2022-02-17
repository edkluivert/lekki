
import 'package:get/get.dart';
import 'package:lekki/data/model/house.dart';
import 'package:lekki/ui/add_house/add_house_screen.dart';
import 'package:lekki/ui/filter/filter_screen.dart';
import 'package:lekki/ui/home/home_screen.dart';
import 'package:lekki/ui/house_details/house_details_screen.dart';

import 'app_routes.dart';

Duration get transitionDuration => const Duration(milliseconds: 1000);

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.queryScreen,
      page: () => FilterScreen(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.addScreen,
      page: () => const AddHouseScreen(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
  ];
}