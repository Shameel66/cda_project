import 'package:cda_project/screens/analyzer/analyzer.dart';
import 'package:cda_project/screens/details/details.dart';
import 'package:cda_project/screens/home/home.dart';
import 'package:cda_project/screens/landind_page/landing_page.dart';
import 'package:cda_project/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/auth/sign_in.dart';

class RoutesHelper {
  static const String initial = '/';
  static const String signIn = '/signIn';
  static const String landingPage = '/landing-page';
  static const String homePage = '/home-page';
  static const String analyzerPage = '/analyzer-page';
  static const String detailPage = '/detail-page';

  static String getInitialRoute() => '$initial';
  static String getSplashRoute() => '$signIn';
  static String getlandingPageRoute()=>'$landingPage';
  static String getHomePage ()=>'$homePage';
  static String getAnalyzerPage ()=>'$analyzerPage';
  static String getDetailPage ()=>'$detailPage';


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => SplashScreen()),
    GetPage(name: signIn, page: () => SignIn()),
    GetPage(name: landingPage, page: () => LandingPage()),
    GetPage(name: homePage, page: () => Home()),
    GetPage(name: detailPage, page: () => Details()),
    GetPage(name: analyzerPage, page: () => Analyzer()),

  ];
}
