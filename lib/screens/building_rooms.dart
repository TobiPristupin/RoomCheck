import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:room_check/managers/building_manager.dart';
import 'package:room_check/model/building.dart';

class BuildingRoom extends StatelessWidget {

  final String building;

  BuildingRoom({Key key, @required this.building}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(building),
      ),
      body: Container(child: _getListView()),
    );
  }

  Widget _getListView() {
    return Consumer<BuildingManager>(
      builder: (context, manager, child) {
        Map<String, Room> rooms = manager.buildings[building];
        List<String> roomNames = rooms.keys.toList();
        List<Room> roomStatus = rooms.values.toList();
        return ListView.separated(
            itemCount: rooms.length,
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 8.0),
            separatorBuilder: (context, index) {
              return Container(height: 8.0);
            },
            itemBuilder: (context, index) {
              return RoomItem(building, roomNames[index], roomStatus[index]);
            });
      },
    );
  }
}

class RoomItem extends StatelessWidget {

  final String _building;
  final String _roomName;
  final Room _room;


  RoomItem(this._building, this._roomName, this._room);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: InkWell(
        onTap: () => this._onTap(context),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: _getListTile(context),
        ),
      ),
    );
  }

  void _onTap(BuildContext context){
    print("pressed");
  }

  Widget _getListTile(BuildContext context) {
    return ListTile(
      title: _getMainText(),
      subtitle: _getSubtitleText(),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 64.0,
            child: _getCheckedIndicator(),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            iconSize: 28.0,
            onPressed: () => _onTap(context),
          )
        ],
      ),
    );
  }

  Widget _getMainText(){
    return Text(
      _roomName,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _getSubtitleText(){
    int boolToInt(bool x){
      return x ? 1 : 0;
    }

    int errors = boolToInt(_room.powerCords) + boolToInt(_room.computers) + boolToInt(_room.dividers) + boolToInt(_room.hasErrorMessage);
    return Text("Errors: $errors");
  }


  Widget _getCheckedIndicator(){
    return LinearPercentIndicator(
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 800,
      progressColor: _room.checked ? Colors.green[500] : Colors.red[500],
      linearStrokeCap: LinearStrokeCap.roundAll,
      percent: 1.0,
    );
  }
}

