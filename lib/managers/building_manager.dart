import 'package:flutter/cupertino.dart';

enum RoomState {
  checked,
  warning,
  error
}

class BuildingManager extends ChangeNotifier {
  Map<String, Map<String, RoomState>> _allBuildings = {
    "100": {
      "101": RoomState.error,
    },
    "200": {
      "201": RoomState.error,
      "202": RoomState.error,
      "203": RoomState.error,
    },
    "300": {
      "301": RoomState.error,
    },
    "400": {
      "401": RoomState.error,
      "402": RoomState.error,
      "403": RoomState.error,
      "404": RoomState.error,
      "405": RoomState.error,
      "406": RoomState.error,
      "407": RoomState.error,
      "408": RoomState.error,
      "409": RoomState.error,
      "410": RoomState.error,
      "411": RoomState.error,
      "412": RoomState.error,
      "413": RoomState.error,
      "414": RoomState.error,
      "415": RoomState.error,
      "416": RoomState.error,
      "417": RoomState.error,
      "418": RoomState.error,
      "419": RoomState.error,
      "420": RoomState.error,
    },
    "800": {
      "801": RoomState.error,
    },
    "Portables": {
      "P01": RoomState.error,
    },
  };

  void toggleRoom(String building, String roomNumber) {
    RoomState state = _allBuildings[building][roomNumber];
    switch (state) {
      case RoomState.error:
        _allBuildings[building][roomNumber] = RoomState.warning;
        break;
      case RoomState.warning:
        _allBuildings[building][roomNumber] = RoomState.checked;
        break;
      case RoomState.checked:
        _allBuildings[building][roomNumber] = RoomState.error;
        break;
    }
    notifyListeners();
  }

  Map<String, Map<String, RoomState>> get buildings => _allBuildings;
}
