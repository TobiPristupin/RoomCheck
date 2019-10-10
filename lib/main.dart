import 'package:flutter/material.dart';
import 'package:room_check/routes.dart';
import 'package:room_check/screens/home_menu.dart';
import 'package:room_check/theme.dart';

void main(){
  runApp(RoomCheckerApp());
}

class RoomCheckerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RoomChecker",
      theme: appTheme,
      initialRoute: "/",
      routes: {
        homeRoute : (context) => HomeMenu(),
      },
    );
  }
}