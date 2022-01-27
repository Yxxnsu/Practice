import 'package:get/get.dart';
import 'package:getx_travel_crud/binding/home_binding.dart';
import 'package:getx_travel_crud/binding/init_binding.dart';
import 'package:getx_travel_crud/screens/destination_screen.dart';
import 'package:getx_travel_crud/screens/home_screen.dart';
import 'package:getx_travel_crud/screens/login/login.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const GENDER = Routes.GENDER;
  static const HOME = Routes.HOME;
  static const DESTINATION = Routes.DESTINATION;

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => const LoginScreen(),
      binding: InitBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: DESTINATION,
      page: () => const DestinationScreen(),
    ),
    GetPage(
      name: GENDER,
      page: () => const GenderScreen(),
    ),
  ];
}
