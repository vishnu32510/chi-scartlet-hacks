import 'dart:async';
import 'package:chi_scartlethack/screens/places_list/places_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/splash';

  const Splash({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>
            const Splash()
    );
  }
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed(PlacesList.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
          onDoubleTap: () {
            // route();
          },
          child: Lottie.asset(
            AppAssets.splash1,
            // repeat: false,
            // reverse: false,
            // animate: false,
          ),
        ),
      ),
    );
  }
}
