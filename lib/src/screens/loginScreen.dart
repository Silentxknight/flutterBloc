import 'package:flutter/material.dart';
import 'package:bloc_arc/src/bloc/bloc.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

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

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: ((context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
            ),
          );
        }));
  }

  Widget passwordField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password', labelText: 'Password'),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('log in'),
    );
  }
}
