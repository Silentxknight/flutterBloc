import 'dart:async';
class Validators{
  final validateEmail= StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Enter A Valid Email');
      }
    } 
  );
  final validatePass=StreamTransformer<String,String>.fromHandlers(
    handleData: (password, sink){
      if(password > 3){
        sink.add(password);
      }else{
        sink.addError('Enter A Valid PAssword');
      }
    } 
  );
}