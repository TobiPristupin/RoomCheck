import 'package:flutter/cupertino.dart';

class BuildingManager extends ChangeNotifier {
  Map<String, Map<String, bool>> _allBuildings = {
    "100": {
      "101": false,
    },
    "200": {
      "201": false,
      "202": false,
      "203": true,
    },
    "300": {
      "301": true,
    },
    "400": {
      "401": false,
      "402": false,
      "403": true,
      "404": true,
      "405": true,
    },
    "800": {
      "801": false,
    },
    "Portables": {
      "P01": false,
    },
  };

  void checkRoom(String building, String roomNumber) {
    if (_allBuildings[building][roomNumber] == false) {
      _allBuildings[building][roomNumber] = true;
      notifyListeners();
    }
  }

  void uncheckRoom(String building, String roomNumber) {
    if (_allBuildings[building][roomNumber] == true) {
      _allBuildings[building][roomNumber] = false;
      notifyListeners();
    }
  }

  void toggleRoom(String building, String roomNumber) {
    _allBuildings[building][roomNumber] = !_allBuildings[building][roomNumber];
    notifyListeners();
  }

  Map<String, Map<String, bool>> get buildings => _allBuildings;
}
