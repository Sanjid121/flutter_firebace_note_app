import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

TextEditingController ss = TextEditingController();

class _AddNoteState extends State<AddNote> {
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
      alignment: Alignment.topRight,
       children: [ Container(
          height: 300,
          child: Center(
            child: Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  maxLines: 8,
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: ss,
                ),
              ),
            ),
          ),
        ),
  
          Padding(
            padding: const EdgeInsets.only(right:  30),
            child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 77, 190, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                
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
