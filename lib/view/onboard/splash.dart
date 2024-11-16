import 'package:flutter/material.dart';
import 'package:flutter_firebace1/view/auth/Sign_In.dart';
import 'package:flutter_firebace1/view/home/Home_v2.dart';
import 'package:flutter_firebace1/view/onboard/Onboarding_1.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 0), () async {
      await onboardCheck();
    });
    super.initState();
  }

  onboardCheck() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (sp.getBool("onboard") == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Page1()));
    } else {
      if (sp.getBool("isAuth") != null && sp.getBool("isAuth") == true) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Firebase\n    Note",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist'),
          ),
        ),
      ),
    );
  }
}
