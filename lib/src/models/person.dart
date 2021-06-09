class Person {
  static const tblPerson = 'persons';
  static const colId = 'id';
  static const colName = 'name';
  static const colLastName = 'lastName';
  static const colAddress = 'address';
  static const colPhone = 'phone';

  Person.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    lastName = map[colLastName];
    address = map[colAddress];
    phone = map[colPhone];
  }

  int id;
  String name;
  String lastName;
  String address;
  num phone;

  Person({this.id, this.name, this.lastName, this.address, this.phone});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colLastName: lastName,
      colAddress: address,
      colPhone: phone
    };
    if (id != null) map[colId] = id;
    return map;
  }
}