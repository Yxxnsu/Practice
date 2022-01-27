import 'package:get/route_manager.dart';
import 'package:getx_travel_crud/binding/init_binding.dart';
import 'package:getx_travel_crud/screens/destination_screen.dart';
import 'package:getx_travel_crud/screens/home_screen.dart';
import 'package:getx_travel_crud/screens/login/gender_screen.dart';
import 'package:getx_travel_crud/screens/login/login_screen.dart';

var getPages = <GetPage>[
  GetPage(
    name: '/',
    page: () => const LoginScreen(),
    binding: InitBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => HomeScreen(),
    binding: InitBinding(),
  ),
  GetPage(
    name: '/destination',
    page: () => const DestinationScreen(),
  ),
  GetPage(
    name: '/login/gender',
    page: () => const GenderScreen(),
  ),
];
