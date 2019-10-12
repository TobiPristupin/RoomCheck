import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_check/managers/building_manager.dart';
import 'package:room_check/routes.dart';
import 'package:room_check/screens/home_menu.dart';
import 'package:room_check/theme.dart';

void main(){
  runApp(RoomCheckerApp());
}

class RoomCheckerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => BuildingManager(),
        )
      ],
      child: MaterialApp(
        title: "RoomChecker",
        theme: appTheme,
        initialRoute: "/",
        routes: {
          homeRoute: (context) => HomeMenu(),
        },
      ),
    );
  }
}