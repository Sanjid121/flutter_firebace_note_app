import 'package:flutter/material.dart';
import 'package:flutter_firebace1/controller/authController.dart';
import 'package:flutter_firebace1/view/auth/Sign_In.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';

import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final authCtr = Get.find<Authcontroller>();

  // Regular expression to check the conditions

  final RegExp regexnumber = RegExp(r'(?=.*[1-9])');
  final RegExp regexUpercaser = RegExp(r'(?=.*[A-Z])');
  final RegExp regexLowercase = RegExp(r'(?=.*[a-z])');
// validation function add
  void _validateInput(String value) {
    setState(() {
      if (passText.length >= 8) {
        langthCheck = true;
      } else {
        langthCheck = false;
      }
      if (regexnumber.hasMatch(value)) {
        numbrtCheck = true;
      } else {
        numbrtCheck = false;
      }
      if (regexUpercaser.hasMatch(value)) {
        upperCaseCheck = true;
      } else {
        upperCaseCheck = false;
      }
      if (regexLowercase.hasMatch(value)) {
        lowerCaseCheck = true;
      } else {
        lowerCaseCheck = false;
      }
    });
  }

  // Variable add

  String passText = "";
  bool numbrtCheck = false;
  bool upperCaseCheck = false;
  bool lowerCaseCheck = false;
  bool langthCheck = false;
  bool tramsContitionCheck = false;

// show status add
  Widget StatusWidget(String msg, {bool? isok = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            isok == true ? Icons.check : Icons.close,
            color: isok == true ? Colors.green : Colors.red,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(msg)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: Container(
                      height: 24,
                      width: 24,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/128/2722/2722991.png',
                        height: 24,
                        fit: BoxFit.cover,
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                height: 82,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Sign Up', 24, FontWeight.w700, 0xFFF1D1E25),
                    SizedBox(
                      height: 7,
                    ),
                    text('Create account and enjoy all services', 16,
                        FontWeight.w400, 0xFFF808D9E),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                  width: 345, height: 48, child: custom_elebatbutton()),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: custom_devidar()),
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
                    ctr: authCtr.name, 'Type your username', Icons.person),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 335,
                child: custom_text_from(
                    ctr: authCtr.email,
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
                'Type your password',
                Icons.lock_outline_rounded,
                ctr: authCtr.password,
                oneChangefn: (value) {
                  _validateInput(value);
                  setState(() {
                    passText = value;
                  });
                },
                sd: Icon(Icons.visibility_off),
                hide_text: true,
              )),
            ),
            SizedBox(
              height: 10,
            ),
          
            if (passText.length > 1)
              (langthCheck && numbrtCheck && upperCaseCheck && lowerCaseCheck)
                  ? StatusWidget("Cool! You have very strong password",
                      isok: true)
                  : Column(
                      children: [
                        StatusWidget("Minimum 8 characters",
                            isok: langthCheck),
                        StatusWidget("Atleast 1 number (1-9)",
                            isok: numbrtCheck),
                        StatusWidget("Atleast lowercase or uppercase letters",
                            isok: (upperCaseCheck && lowerCaseCheck)),
                      ],
                    ),
            SizedBox(
              height: 10,
            ),
            Row(
           mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Container(
                    child: Checkbox(
                        activeColor: authCtr.aggrement.value
                            ? Colors.green
                            : Colors.grey,
                        value: authCtr.aggrement.value,
                        onChanged: (value) {
                          setState(() {
                            authCtr.aggrement.value = value!;
                          });
                        }),
                  ),
                ),
                text('I agree to the company', 14, FontWeight.w400,
                    0xFFF808D9E),
                SizedBox(
                  width: 3,
                ),
                text('Term of Service', 14, FontWeight.w700, 0xFFF1D1E25),
                SizedBox(
                  width: 3,
                ),
                text('and', 14, FontWeight.w400, 0xFFF808D9E),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right:  115),
                child: text('Privacy Policy', 14, FontWeight.w700, 0xFFF1D1E25),
              )),
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
                      await authCtr.UserSignup(context);
                    
                    }, 'Sign Up')),
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
                  text('Have an account?', 14, FontWeight.w700, 0xFFF808D9E),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: text('Sign In', 14, FontWeight.w700, 0xFFF0062FF),
                  ),
                ],
              ),
            ),
            Container(
              height: 73,
            )
          ],
        ),
      ),
    );
  }
}
