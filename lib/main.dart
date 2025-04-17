import 'package:app_taste/UI/_core/app_theme.dart';
import 'package:app_taste/UI/splash/splash_screen.dart';
import 'package:app_taste/data/restaurant_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurant();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => restaurantData)],
      child: myApp(),
    ),
  );
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}
