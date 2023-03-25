import 'package:flutter/material.dart';
import 'package:movie_rating_flutter/screens/detail.dart';
import 'package:movie_rating_flutter/screens/home.dart';
import 'package:movie_rating_flutter/screens/login.dart';
import 'package:movie_rating_flutter/screens/shows.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  future: Firebase.initializeApp();
  runApp(MaterialApp(
    // theme: ThemeData(fontFamily: 'Sans'),
  home: Login(),
      debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login':(context) => Login(),
      '/home' : (context) => Home(),
      '/shows' : (context) => Show(),
      '/detail' : (context) => Detail()
    },
  ));
}
