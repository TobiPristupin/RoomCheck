import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:room_check/buildings.dart';

class BuildingRoom extends StatelessWidget {
  final Building building;

  BuildingRoom({Key key, @required this.building}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(building.name),
      ),
      body: Container(child: _buildListView()),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        itemCount: building.rooms.length,
        padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 8.0),
        separatorBuilder: (context, index) {
          return Container(height: 8.0);
        },
        itemBuilder: (context, index) {
          return RoomItem(building.rooms[index]);
        });
  }
}

class RoomItem extends StatefulWidget {
  final String _room;

  RoomItem(this._room);

  @override
  _RoomItemState createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  bool _checked = false;
  bool _warning = Random().nextBool();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildListTile(),
          ),
          onTap: (){
            setState(() {
              _checked = !_checked;
            });
          },
      ),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      title: Text(
        widget._room,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        width: 48.0,
        child: LinearPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 800,
          progressColor: _warning ? Colors.yellow[500] : Colors.green[500],
          linearStrokeCap: LinearStrokeCap.roundAll,
          percent: 1.0,
        ),
      ),
    );
  }
}
