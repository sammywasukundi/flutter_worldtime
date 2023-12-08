import 'package:flutter/material.dart';
import 'package:starting_world_time/pages/choose_location.dart';
import 'package:starting_world_time/pages/home.dart';
import 'package:starting_world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // routes
      '/':(context) => Loading(), 
      '/home':(context) => Home(),
      '/Location':(context) =>  ChooseLocation(),
    },
  ));
}


