import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebace1/controller/contrllerInit.dart';
import 'package:flutter_firebace1/view/onboard/splash.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp();

  ControllerInit.Init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}
