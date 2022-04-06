import 'dart:async';
import 'validators/validators.dart';


//?for using mixins extends to Object class
class Bloc extends Object with Validators{
  final _email = StreamController<String>();
  final _password = StreamController<String>();


 // add data to stream
  Stream<String> get email => _email.stream;
  Stream<String> get password => _password.stream;
  

  // change data
  Function(String) get changeEmail=>_email.sink.add;
  Function(String) get changePassword=>_password.sink.add;

}

final bloc = Bloc();
