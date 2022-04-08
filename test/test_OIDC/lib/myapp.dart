//https://auth0.com/blog/get-started-with-flutter-authentication/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();



/// -----------------------------------
///           Auth0 Variables
/// -----------------------------------

const AUTH0_DOMAIN = 'YOUR-AUTH0-DOMAIN';
const AUTH0_CLIENT_ID = 'YOUR-AUTH0-CLIENT-ID';
const AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  bool isBusy = false;
  bool isLoggedIn = false;

  String errorMessage = "";
  String name = "";
  String picture = "";

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
	 appBar: AppBar(
	    title: Text('Auth0 demo'),
	 ),
	 body: Center(
	   child: Text('Imple User AuthN'),
	 ),
       ),
      );
   }
}





class Profile extends StatelessWidget {
   final logoutAction;
   final String name;
   final String picture;

   Profile(this.logoutAction, this.name, this.picture);

   @override
   Widget build(BuildContext context){
     return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
             width: 150,
             height: 150,
             decoration: BoxDecoration(
                 border: Border.all(color: Colors.blue, width:4.0),
                 shape: BoxShape.circle,
                 image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(picture ?? ''),
                 ),
             ),
          ),
          SizedBox(height: 24.0),
          Text('Name: $name'),
          SizedBox(height: 48.0),
          RaisedButton(
             onPressed:() {
                logoutAction();
             },
             child: Text('Logout'),
          ),
        ],
      );
   }
}


class Login extends StatelessWidget {

   final loginAction;
   final String loginError;
     
   const Login(this.loginAction, this.loginError);

   @override
   Widget build(BuildContext context){
     return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           RaisedButton(
             onPressed: () {
                loginAction();
             },
             child: Text('Login'),
           ),
           Text(loginError ?? ''),
        ],
      );
   }

}