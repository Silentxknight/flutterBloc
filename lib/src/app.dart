import 'package:bloc_arc/src/model/Employee.dart';
import 'package:bloc_arc/src/screens/EmployeeScreen.dart';
import 'package:bloc_arc/src/screens/loginScreen.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Me In',
      home: Scaffold(
        appBar:AppBar(title: Text('Login Screen')),
        body:EmployeeScreen(), ),
    );
  }

}