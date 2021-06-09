import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_app/src/bloc/validators.dart';
import 'package:flutter_app/src/providers/database_helper.dart';

class PersonBloc with Validators {

  PersonBloc() {
    cargarPersonas();
  }

  final _name = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();

  final _personas = BehaviorSubject<List<Person>>();

  // Recuperar los datos del Stream
  Stream<String> get nameStream => _name.stream.transform(validarName);
  Stream<String> get lastNameStream => _lastName.stream.transform(validarLastName);
  Stream<String> get addressStream => _address.stream.transform(validarAddress);
  Stream<String> get phoneStream => _phone.stream.transform(validarPhone);

  Stream<List<Person>> get personasStream => _personas.stream;

  Stream<bool> get formValidStream => 
      Rx.combineLatest4(nameStream, lastNameStream, addressStream, phoneStream, (a, b, c, d) => true);

  // Insertar valores al Stream
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(String) get changePhone => _phone.sink.add;

  // Obtener el último valor ingresado a los streams
  String get name    => _name.value;
  String get lastName => _lastName.value;
  String get address    => _address.value;
  String get phone => _phone.value;

  // Metodo para la insercion

  void cargarPersonas() async {
    final personas = await DatabaseHelper.instance.fetchPersons();
    _personas.sink.add(personas);
  }

  void agregarPersona() async {
    num valor = num.parse(phone);
    final person = Person(name: name, lastName: lastName, address: address, phone: valor);
    await DatabaseHelper.instance.insertPerson(person);
    cargarPersonas();
  }

  void borrarPersona(int id) async {
    await DatabaseHelper.instance.deletePerson(id);
  }

  dispose() {
    _name?.close();
    _lastName?.close();
    _address?.close();
    _phone?.close();
    _personas?.close();
  }
}
