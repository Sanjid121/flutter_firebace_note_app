import 'package:flutter/material.dart';
import 'package:flutter_firebace1/view/onboard/Onboarding_2-Get%20Started.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _PageState();
}

class _PageState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 424,
              width: double.maxFinite,
              child: Image.asset(
                'assets/sanjid.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                children: [
                  text('Easy Way to Get', 32, FontWeight.w700, 0xFFF242B42),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        text('Amet minim mollit non deserunt', 16,
                            FontWeight.w400, 0xFFF7E8CA0),
                        text('ullamco est sit aliqua dolor do amet', 16,
                            FontWeight.w400, 0xFFF7E8CA0),
                        text('sint. Velit officia consequat.', 16,
                            FontWeight.w400, 0xFFF7E8CA0),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Page2()));
                          },
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xFFF0062FF),
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
