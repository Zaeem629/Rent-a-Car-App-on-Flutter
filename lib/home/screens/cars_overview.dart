import 'package:practice/home/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/cars_grid.dart';
import 'package:practice/services/auth.dart';

class CarsOverviewScreen extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Rent_a_Car', style: SubHeading),
        actions: <Widget>[
        FlatButton.icon(onPressed: () async{
          await _auth.signOut();
        }, icon: Icon(Icons.person), label: Text('Logout'))
      ]
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Available Cars',
              style: MainHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarsGrid(),
          )
        ],
      ),
    );
  }
}
