import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      print(email);
      sink.add(email);
    } else {
      print(email);
      sink.addError('Enter A Valid Email');
    }
  });
  final validatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Enter A Valid PAssword must be at least 4 characters');
    }
  });
}
