part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.INIT;
  static const HOME = _Paths.HOME;
  static const GENDER = _Paths.GENDER;
  static const DESTINATION = _Paths.DESTINATION;

}

abstract class _Paths {
  static const INIT = '/';
  static const HOME = '/home';
  static const GENDER = '/login/gender';
  static const DESTINATION = '/destination';
}
