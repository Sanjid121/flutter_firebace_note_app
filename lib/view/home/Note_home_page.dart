import 'package:flutter/material.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({Key? key}) : super(key: key);

  @override
  _NoteHomePageState createState() => _NoteHomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _NoteHomePageState extends State<NoteHomePage> {
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
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Hey michel,', 24, FontWeight.w700, 0xFFF000000),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(65)),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/128/3135/3135715.png',
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: text('Good morning', 24, FontWeight.w700, 0xFFF000000),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                color: Color(0xFFFF5F6FB),
                width: 400,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search '),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: text('NOTE', 24, FontWeight.w700, 0xFFF000000),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_NOTE_Card(
                    color: 0xFFFE8F5FB, Health: 'Health', may: '20 may'),
                custom_NOTE_Card(
                    color: 0xFFFFFF4E0, Health: 'Food', may: '15 may')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_NOTE_Card(
                    color: 0xFFFFFE9F5, Health: 'Shop list', may: '20 may'),
                custom_NOTE_Card(
                    color: 0xFFFF4F5F7, Health: '+ Add new', may: '20 may'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.grid_view_outlined,
                        size: 50,
                      ))),
            ),
            SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFF2CC0EB),
                ),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.person,
                  size: 50,
                ))
          ],
        ),
      ),
    
    );
  }
}
