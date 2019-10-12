import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:room_check/managers/building_manager.dart';

class BuildingRoom extends StatelessWidget {

  final String building;

  BuildingRoom({Key key, @required this.building}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(building),
      ),
      body: Container(child: _buildListView()),
    );
  }

  Widget _buildListView() {
    return Consumer<BuildingManager>(
      builder: (context, manager, child) {
        Map<String, bool> rooms = manager.buildings[building];
        List<String> roomNames = rooms.keys.toList();
        List<bool> roomStatus = rooms.values.toList();
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

class RoomItem extends StatefulWidget {

  final String _building;
  final String _roomName;
  final bool _roomChecked;

  RoomItem(this._building, this._roomName, this._roomChecked);

  @override
  _RoomItemState createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {

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
            Provider.of<BuildingManager>(context).toggleRoom(
                widget._building, widget._roomName);
          },
      ),
    );
  }

  Widget _buildListTile() {
    return ListTile(
      title: Text(
        widget._roomName,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        width: 48.0,
        child: LinearPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 800,
          progressColor: widget._roomChecked ? Colors.green[500] : Colors
              .red[500],
          linearStrokeCap: LinearStrokeCap.roundAll,
          percent: 1.0,
        ),
      ),
    );
  }
}
