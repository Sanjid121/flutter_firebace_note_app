import 'package:flutter/material.dart';
import 'Sign_up.dart';
import '../widgets/widget.dart';
import 'package:pinput/pinput.dart';

class SignUpVerifyCodeEmail extends StatefulWidget {
  const SignUpVerifyCodeEmail({Key? key}) : super(key: key);

  @override
  _SignUpVerifyCodeEmailState createState() => _SignUpVerifyCodeEmailState();
}

class _SignUpVerifyCodeEmailState extends State<SignUpVerifyCodeEmail> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        leading: Padding(
            padding: const EdgeInsets.all(13.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUp()));
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
      ),
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text('Verify Code', 24, FontWeight.w700, 0xFF1D1E25),
                  SizedBox(height: 5),
                  text('Please enter the code we just sent to email ', 16,
                      FontWeight.w400, 0xFF808D9E),
                  text('timsmxxx@email.com', 16, FontWeight.w400, 0xFF1D1E25),
                ],
              ),
            ),
            SizedBox(height: 40),
            // verafy from
            Center(
              child: Pinput(
                length: 4,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF242B42),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFF0062FF), width: 1),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
