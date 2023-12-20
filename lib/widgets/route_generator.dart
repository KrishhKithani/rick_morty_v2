

import 'package:flutter/material.dart';
import 'package:rick_morty_v2/screens/error_screen.dart';
import 'package:rick_morty_v2/screens/home_screen.dart';

class RouteGenerator{
  static Route generateRoute(settings){
    switch(settings.name){
      case '/' :
        return MaterialPageRoute(builder: (context) => const HomeScreen()
        );
      default:
        return MaterialPageRoute(builder: (context)=> const ErrorScreen());
    }
  }
}