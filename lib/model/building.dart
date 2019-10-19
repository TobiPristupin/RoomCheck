class Room {

  String number;
  bool checked;
  bool powerCords;
  bool dividers;
  bool computers;
  bool hasErrorMessage;
  String errorMessage;

  Room(this.number, this.checked, this.powerCords, this.dividers, this.computers,  [this.errorMessage]){
    this.hasErrorMessage = this.errorMessage != null;
  }

}