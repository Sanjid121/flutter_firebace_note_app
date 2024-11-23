import 'package:flutter/material.dart';
import 'package:flutter_firebace1/DatabaseService/authService.dart';
import 'package:flutter_firebace1/controller/authController.dart';
import 'package:flutter_firebace1/controller/note_controlar.dart';
import 'package:flutter_firebace1/view/home/Drowar.dart';
import 'package:flutter_firebace1/view/home/add%20note.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({Key? key}) : super(key: key);

  @override
  _NoteHomePageState createState() => _NoteHomePageState();
}

MaxLine(int index) {
  var sum = ((index % 4 + 1) * 1);

  switch (sum) {
    case 1:
      return sum + 2;
    case 2:
      return sum + 3;
    case 3:
      return sum + 4;
    case 4:
      return sum + 5;
    default:
      return sum + 2;
  }
}

class _NoteHomePageState extends State<NoteHomePage> {
  final notectr = Get.find<NoteControlar>();
    void initState() {
    Future.delayed(Duration(microseconds: 0), () async {
      await nctr.noteget();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: Drowar(),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (notectr.scrollPosition.value < 10)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 70, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text('Hey michel,', 24, FontWeight.w700,
                                  0xFFF000000),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(65)),
                                    child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/128/3135/3135715.png',
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: text(
                            'Good morning', 24, FontWeight.w700, 0xFFF000000),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Padding(padding: EdgeInsets.only(top: 55)),
            Center(
              child: Container(
                color: Color(0xFFFF5F6FB),
  
                width: 350,
                child: TextField(
                  style: TextStyle(fontFamily: 'Urbanist',fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),

                  textAlignVertical: TextAlignVertical.bottom,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    isDense: true,
                
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search ' ,labelStyle: TextStyle(fontFamily: 'Urbanist',fontWeight: FontWeight.w400)),
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
         
            Expanded(
              child: notectr.isloding.isTrue? Center(child: CircularProgressIndicator(),): MasonryGridView.builder(
                  controller: notectr.scrollController,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: notectr.notedata.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        print('hello');
                      },
                      child: Container(
                        margin: index == 1
                            ? EdgeInsets.only(top: 30)
                            : EdgeInsets.only(top: 0),
                        child: custom_NOTE_Card(
                            ((index % 4 + 1) * 44 + 200), MaxLine(index),
                            color: 0xFFFE8F5FB,
                            Health: notectr.notedata[index]['notes'],
                            may: '20 may'),
                      ),
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.grid_view_rounded,
                        size: 35,
                      ))),
                      FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 77, 190, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
                  },
                  elevation: 10,
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              Center(
                  child: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.person_2_rounded,
                      size: 40,
                    )),
              ))
            ],
          ),
        ),
      );
    });
  }
}
