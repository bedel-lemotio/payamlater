import 'package:get/get.dart';
import 'package:payamlater/presentation/features/salesperson/home/views/home_salesperson.dart';

import '../../presentation/features/authentication/views/auth.dart';
import '../../presentation/features/bindings/auth_binding.dart';
import '../../presentation/features/bindings/home_binding.dart';
import '../../presentation/features/bindings/sales_dashboard_binding.dart';
import '../../presentation/features/home/views/home.dart';
import '../../presentation/features/splashscreen/view/splashscreen.dart';
import '../../presentation/features/welcome/view/welcome.dart';





final List<GetPage<dynamic>> routes = [

  GetPage(
    name: '/',
    page: () => SplashScreen(),
  ),

  GetPage(
    name: '/welcome',
    page: () => Welcome(),
  ),

  GetPage(
      name: '/login',
      page: () => Auth(),
      binding: AuthBinding()
  ),

  GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBinding()
  ),

  GetPage(
      name: '/salesdashboard',
      page: () => SalesDashBoard(),
      binding: SalesDashboardBinding(),
  ),

];
