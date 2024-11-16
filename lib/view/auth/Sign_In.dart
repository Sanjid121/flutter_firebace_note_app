import 'package:flutter/material.dart';
import 'package:flutter_firebace1/controller/authController.dart';

import 'package:get/get.dart';
import '../widgets/widget.dart';
import 'Sign_up.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final autCtr = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFFFFFF), Color(0xFFFFFFFFF)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 116, left: 24),
                child: Container(
                  height: 100,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text('Welcome Back!', 24, FontWeight.w700, 0xFFF1D1E25),
                      SizedBox(
                        height: 7,
                      ),
                      text('Sign In to your account', 16, FontWeight.w400,
                          0xFFF808D9E),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    width: 345,
                    height: 48,
                    child: custom_elebatbutton(onpress: () async {
                      await autCtr.GoogleAuth();
                    })),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  custom_devidar(),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: text('OR', 16, FontWeight.w700, 0xFFF808D9E),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 11),
                    child: custom_devidar(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: 335,
                  child: custom_text_from(
                      ctr: autCtr.email,
                      'Type your email',
                      Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 335,
                    child: custom_text_from(
                        ctr: autCtr.password,
                        'Type your password',
                        Icons.lock_outline_rounded,
                        sd: Icon(Icons.visibility_off))),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:  230 ),
                  child: Container(
                    child: InkWell(
                      onTap: () {},
                      child: text(
                          'Forgot Password?', 14, FontWeight.w700, 0xFFF0062FF),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 358,
                  height: 48,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: custom_ElevatedButton(() async {
                        await autCtr.UserSignin(context);
                      }, 'Sign In')),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have account? ',
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF7E8CA0)),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF0062FF)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
