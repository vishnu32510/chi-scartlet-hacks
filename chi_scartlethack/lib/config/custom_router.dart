import 'package:chi_scartlethack/models/places_model.dart';
import 'package:chi_scartlethack/screens/places_details_screen.dart/places_details_screen.dart';
import 'package:chi_scartlethack/screens/places_list/my_plan_list_screen.dart';
import 'package:chi_scartlethack/screens/places_list/places_list_screen.dart';
import 'package:chi_scartlethack/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('Route: ${settings.name}');
    switch (settings.name) {
      case Splash.routeName:
        return Splash.route();
      case PlacesList.routeName:
        return PlacesList.route();
      case PlacesDetailsScreen.routeName:
        PlacesModel arg = settings.arguments as PlacesModel;
        return PlacesDetailsScreen.route(arg);
      case MyPlansListScreen.routeName:
        return MyPlansListScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Center(child: Text('Error Page')),
              ),
            ));
  }
}
