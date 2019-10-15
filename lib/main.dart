import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_check/managers/building_manager.dart';
import 'package:room_check/routes.dart';
import 'package:room_check/screens/home_menu.dart';
import 'package:room_check/theme.dart';


Future<void> main() async {
  final FirebaseApp firebaseApp = await FirebaseApp.configure(
    name: "RoomCheck",
    options: const FirebaseOptions(
        googleAppID: "1:1013874661870:android:24205163941bdaa956d6ff",
        apiKey: "AIzaSyBA6OK0BNkHO8cRAbsoYmibDVJV82xwbqE",
        databaseURL: "https://room-check-7f56b.firebaseio.com"
    ),
  );

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