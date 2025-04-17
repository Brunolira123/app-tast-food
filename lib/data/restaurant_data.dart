import 'dart:convert';

import 'package:app_taste/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurant() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString); //decode json data
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantsData in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantsData);
      listRestaurant.add(restaurant);
    }
  }
}
