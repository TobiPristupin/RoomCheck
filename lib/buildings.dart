class Building {

  final String name;
  final List<String> rooms;

  Building(this.name, this.rooms);
}


final List<Building> buildings = [
  Building("100", ["101", "102", "..."]),
  Building("200", ["201", "202", "..."]),
  Building("300", ["301", "302", "..."]),
  Building("400", List.generate(20, (index) => (index + 401).toString())),
  Building("800", ["801", "802", "..."]),
  Building("Portables", ["P1", "P2", "..."]),
];