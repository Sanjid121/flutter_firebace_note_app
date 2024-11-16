import 'package:flutter/material.dart';

double sm_device = 12.0;

Widget bubleImage(AssetImage? sanjid, {double? l}) {
  return Positioned(
    top: 0,
    left: l ?? 0,
    child: CircleAvatar(
      radius: 17,
      backgroundImage: sanjid,
    ),
  );
}

Widget circal(
  String id,
  double size,
  int color,
  int bg,
) {
  return CircleAvatar(
    radius: 16,
    backgroundColor: Color(bg),
    child: Text(
      id,
      style: TextStyle(
          fontFamily: 'Urbanist',
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: Color(color)),
    ),
  );
}

Widget imagecircl(
  AssetImage? sd,
) {
  return CircleAvatar(
    radius: 16,
    backgroundImage: sd,
  );
}

Widget text(String id, double fsize, FontWeight sd, int color) {
  return Text(
    id,
    style: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: fsize,
        fontWeight: sd,
        color: Color(color)),
  );
}

Widget custom_elebatbutton({Function? onpress}) {
  return ElevatedButton.icon(
    onPressed: () async {
      await onpress!();
    },
    style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFFF),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFFE9ECF2), width: 0.5),
          borderRadius: BorderRadius.circular(3),
        )),
    label: Padding(
      padding: const EdgeInsets.all(5.0),
      child: text('Sign in with Google', 14, FontWeight.w600, 0xFFF2B3453),
    ),
    icon: Row(
      children: [
        Image.asset(
          'assets/sanjid3.png',
          height: 24,
          width: 24,
        ),
      ],
    ),
  );
}

Widget custom_text_from(
  String id,
  IconData ic, {
  Widget? sd,
  TextEditingController? ctr,
  Function? oneChangefn,
  bool hide_text = false,
}) {
  return TextField(
    controller: ctr,
    onChanged: (value) {
      if (oneChangefn != null) {
        oneChangefn(value);
      }
      ;
    },
    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFE9ECF2))),
      suffixIcon: sd,
      prefixIcon: SizedBox(
          width: 20,
          child: Icon(
            ic,
            size: 20,
          )),
      labelText: id,
      labelStyle: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFF7E8CA0),
      ),
    ),
    obscureText: hide_text,
  );
}

Widget custom_devidar() {
  return Container(
    height: 1,
    width: 140,
    child: Divider(),
  );
}

Widget custom_ElevatedButton(
  Function onpress,
  String font,
) {
  return ElevatedButton(
      onPressed: () async {
        await onpress();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF0062FF),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(
        font,
        style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF)),
      ));
}

Widget custombox(
  String? sds,
  int? col,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 86,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFFE6E9ED), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color(col!),
              width: 2,
              height: 54,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sds!,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      color: Color(0xFFF242B42),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Color(0xFFF7E8CA0),
                      ),
                      Text(
                        ' 18 May, 2022',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 12,
                          color: Color(0xFFF808D9E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(Icons.flag, color: Colors.red),
          ],
        ),
      ),
    ],
  );
}

Widget custom_NOTE_Card({int ?color,String ? Health,String ? may  }) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 230,
      width: 200,
      child: Card(
        color: Color(color!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Health!,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF000000)),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'Lorem ipsum dolor sit',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF000000)),
                  ),
                  Text(
                    'amet, consectatur',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF000000)),
                  ),
                  Text(
                    'adipiscing elit. Donec',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF000000)),
                  ),
                  Text(
                    'fermentum in libero sit',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF000000)),
                  ),
                  Text(
                    'amet dignissim.',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF000000)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    may!,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF000000)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
