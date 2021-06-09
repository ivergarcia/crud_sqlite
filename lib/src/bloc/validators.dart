import 'dart:async';

class Validators {
  final validarName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 4) {
      sink.add(name);
    } else {
      sink.addError('Mínimo 4 caracteres por favor');
    }
  });

  final validarLastName = StreamTransformer<String, String>.fromHandlers(
      handleData: (lastName, sink) {
    if (lastName.length >= 4) {
      sink.add(lastName);
    } else {
      sink.addError('Mínimo 4 caracteres por favor');
    }
  });

  final validarAddress = StreamTransformer<String, String>.fromHandlers(
      handleData: (address, sink) {
    if (address.length >= 8) {
      sink.add(address);
    } else {
      sink.addError('Mínimo 8 caracteres por favor');
    }
  });

  final validarPhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (7 <= phone.length && phone.length <= 8) {
      sink.add(phone);
    } else {
      sink.addError('Numeros entre 7 a 8 digitos por favor');
    }
  });
}
