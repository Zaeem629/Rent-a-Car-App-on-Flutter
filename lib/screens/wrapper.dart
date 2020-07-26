import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './authenticate/authenticate.dart';
import 'package:practice/models/user.dart';

//import './home/home.dart';
import 'package:practice/home/screens/cars_overview.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    

    

  //  return Home();
  //  return Authenticate();

  if(user == null){
    return Authenticate();
  }
  else{
    return CarsOverviewScreen();
  }

  }
}