import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_travel_crud/binding/init_binding.dart';
import 'package:getx_travel_crud/constant/get_page.dart';
import 'package:getx_travel_crud/routes/app_pages.dart';
import 'package:getx_travel_crud/screens/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TRAVEL CRUD',
      initialRoute: '/',
      initialBinding: InitBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFD8ECF1),
        ),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
