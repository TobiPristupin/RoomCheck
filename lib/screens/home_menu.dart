import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:room_check/bloc/bloc_provider.dart';
import 'package:room_check/bloc/home_menu_bloc.dart';
import 'package:room_check/screens/building_rooms.dart';

import '../buildings.dart';

class HomeMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room Checker"),
      ),
      body: Container(child: _buildGridView()),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all((16.0)),
      children:
          List.generate(buildings.length, (index) => MenuOption(buildings[index])),
    );
  }
}

class MenuOption extends StatefulWidget {
  final Building _building;

  MenuOption(this._building);

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {

  int _percent = 0;

  @override
  Widget build(BuildContext context) {
    if (widget._building.name == "100") {
      _percent = 20;
    } else if (widget._building.name == "200"){
      _percent = 70;
    } else if (widget._building.name == "300"){
      _percent = 100;
    }

    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return BuildingRoom(building: widget._building,);
              })
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCardText(),
            _buildPercentIndicator(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardText() {
    return Text(
      widget._building.name,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPercentIndicator(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 800,
      progressColor: _getColor(_percent),
      linearStrokeCap: LinearStrokeCap.roundAll,
      percent: _percent / 100,
    );
  }

  Color _getColor(int percent){
    if (percent == 100){
      return Colors.green[500];
    } else if (percent >= 50){
      return Colors.yellow[500];
    } else {
      return Colors.red[500];
    }
  }
}
