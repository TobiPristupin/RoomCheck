import 'package:flutter/cupertino.dart';
import 'package:room_check/model/building.dart';


class BuildingManager extends ChangeNotifier {
  Map<String, Map<String, Room>> _allBuildings = {
    "100": {
      "101": Room("101", false, false, false, false, null),
    },
    "200": {
      "201": Room("201", false, false, false, false, null),
      "202": Room("202", false, false, false, false, null),
      "203": Room("203", false, false, false, false, null),
    },
    "300": {
      "301": Room("301", false, false, false, false, null),
    },
    "400": {
      "401": Room("401", false, false, false, false, null),
      "402": Room("402", false, false, false, false, null),
      "403": Room("403", false, false, false, false, null),
      "404": Room("404", false, false, false, false, null),
      "405": Room("405", false, false, false, false, null),
      "406": Room("406", false, false, false, false, null),
      "407": Room("407", false, false, false, false, null),
      "408": Room("408", false, false, false, false, null),
      "409": Room("409", false, false, false, false, null),
      "410": Room("410", false, false, false, false, null),
      "411": Room("411", false, false, false, false, null),
      "412": Room("412", false, false, false, false, null),
      "413": Room("413", false, false, false, false, null),
      "414": Room("414", false, false, false, false, null),
      "415": Room("415", false, false, false, false, null),
      "416": Room("416", false, false, false, false, null),
      "417": Room("417", false, false, false, false, null),
      "418": Room("418", false, false, false, false, null),
      "419": Room("419", false, false, false, false, null),
      "420": Room("420", false, false, false, false, null),
    },
    "800": {
      "801": Room("801", false, false, false, false, null),
    },
    "Portables": {
      "P01": Room("P01", false, false, false, false, null),
    },
  };

  void updateRoom(String building, Room room){
    _allBuildings[building][room.number] = room;
    notifyListeners();
  }

  Map<String, Map<String, Room>> get buildings => _allBuildings;
}
