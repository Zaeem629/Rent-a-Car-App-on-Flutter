import 'package:flutter/material.dart';
import 'package:practice/shared/constants.dart';
import 'package:practice/services/auth.dart';
import 'package:practice/shared/loading.dart';

class SignIn extends StatefulWidget {

  
final Function toggleView;
SignIn({ this.toggleView});


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field state

  String email = '';
  String password = '';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return   loading ? Loading() : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text('Sign in for User'),
            actions: <Widget>[
              FlatButton.icon(onPressed: (){
                  widget.toggleView();
              }, icon: Icon(Icons.person), label: Text('Register'))
            ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height:20.0),
                    TextFormField(
                       decoration: textInputDecoration.copyWith(hintText:'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged:(val){
                          setState(() => email = val);
                      }
                      
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'Password'),
                      validator: (val) => val.length < 6 ? 'Enter a password with 6+ charactors' : null,
                      obscureText: true,
                      onChanged:(val){
                        setState(() => password = val);
                      }
                    ),
                    SizedBox(height:20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Sign In',
                        style:TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         if(_formkey.currentState.validate()){
                           setState(() => loading = true);
                           
                           dynamic result = await _auth.signInWithEmailAndPassword(email,password);
                            if(result == null){
                             setState(() { 
                               error = 'please supply a valid Credentials';
                               loading = false;
                               });
                           }
                      }
                      })
                  ]
                ),
              ),
            ),

            );
                
    
  }
}