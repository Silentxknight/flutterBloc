import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('data'),
          emailField(),
          passwordField(),
          submitButton(),
        ],
      ),
    );
  }

    Widget emailField(){
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(hintText: 'you@example.com',labelText:'Email Address') ,
    );
  }

  Widget passwordField(){
    return const TextField(
      decoration: InputDecoration(hintText: 'Password',labelText: 'Password'),
    );
  }
  Widget submitButton(){
    return RaisedButton(onPressed: (){},child: Text('log in'),);
  }
}