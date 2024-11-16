import 'package:flutter/material.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../auth/Sign_In.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

onboardCheck() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setBool("onboard", true);
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          child: Column(
            children: [
              Container(
                  height: h / 1.7, child: Image.asset('assets/sanjid2.png')),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: text(
                        'Plan Your Task Easily and Task Your Plan Instantly',
                        32,
                        FontWeight.w700,
                        0xFFF242B42),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 358,
                height: 48,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: custom_ElevatedButton(() async {
                      await onboardCheck();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => LoginPage()));
                    }, 'Get Started')),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text('Have an account?', 14, FontWeight.w700, 0xFFF808D9E),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () async {
                        await onboardCheck();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: text('Login', 14, FontWeight.w700, 0xFFF0062FF),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
