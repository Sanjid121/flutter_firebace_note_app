import 'package:flutter/material.dart';
import 'package:flutter_firebace1/controller/note_controlar.dart';
import 'package:get/get.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

final nctr = Get.find<NoteControlar>();

class _AddNoteState extends State<AddNote> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 300,
            child: Center(
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      controller: nctr.notectr,
                      decoration: InputDecoration(hintText: 'Title'),
                    ),
                    Container(
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText: 'Write your note',

                            // label: Image.asset('assets/feather.png',height: 40,width: 40,color: Colors.blue,),
                            border: InputBorder.none),
                        controller: nctr.textEditingController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 77, 190, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              onPressed: () async {
                await nctr.Notedatasave(context);
              },
              elevation: 10,
              child: Icon(
                Icons.check_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
