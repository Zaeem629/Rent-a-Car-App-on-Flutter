import 'package:flutter/material.dart';
import 'package:practice/models/user.dart';
import 'package:practice/screens/wrapper.dart';
import 'package:practice/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
          home: Wrapper(),      
      ),
    );
  }
}
