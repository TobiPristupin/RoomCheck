import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:room_check/managers/building_manager.dart';
import 'package:room_check/model/building.dart';
import 'package:room_check/screens/building_rooms.dart';


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
    return Consumer<BuildingManager>(
        builder: (context, manager, child) {
          Map<String, Map<String, Room>> buildings = manager.buildings;
          List<MenuOption> widgets = [];
          buildings.forEach((key, value) {
            widgets.add(MenuOption(key));
          });


          return GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all((16.0)),
            children: widgets,
          );
        }
    );
  }
}

class MenuOption extends StatefulWidget {
  final String _building;

  MenuOption(this._building);

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              //TODO: checkout named navigation with arguments
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
      widget._building,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPercentIndicator(BuildContext context) {
    return Consumer<BuildingManager>(
      builder: (context, manager, child) {
        Map<String, Room> rooms = manager.buildings[widget._building];
        int checked = rooms.values
            .where((x) => x.checked)
            .length;
        double percent = checked / rooms.length;
        return LinearPercentIndicator(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 800,
          progressColor: _getColor(percent),
          linearStrokeCap: LinearStrokeCap.roundAll,
          percent: percent,
        );
      },
    );
  }

  Color _getColor(double percent) {
    if (percent == 1) {
      return Colors.green[500];
    } else if (percent >= 0.5) {
      return Colors.yellow[500];
    } else {
      return Colors.red[500];
    }
  }
}
