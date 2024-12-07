import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_firebace1/controller/note_controlar.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';
import 'package:get/get.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

Color pickerColor = Color(0xff443a49);

Color currentColor = Color(0xff443a49);

final nctr = Get.find<NoteControlar>();

class _AddNoteState extends State<AddNote> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

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
                        maxLines: 5,
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
          Padding(
              padding: const EdgeInsets.only(right: 100),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: pickerColor,
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          // child: ColorPicker(
                          //   pickerColor:pickerColor ,
                          //   onColorChanged: changeColor,
                          // ),
                          // Use Material color picker:
                          //
                          // child: MaterialPicker(
                          //   pickerColor: pickerColor,
                          //   onColorChanged: changeColor,
                          //  // only on portrait mode
                          // ),
                          //
                          // Use Block color picker:
                          //
                          child: BlockPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                          ),
                          //
                          // child: MultipleChoiceBlockPicker(
                          //   pickerColors: currentColors,
                          //   onColorsChanged: changeColors,
                          // ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text(
                              'Got it',
                              style: TextStyle(color: pickerColor),
                            ),
                            onPressed: () async {
                              setState(() => currentColor = pickerColor);
                              Navigator.of(context).pop();
            
                              print('object');
                            },
                          ),
                        ],
                      );
                    });
                },
                child: Container(
                  height:55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                      child: Image.asset('assets/color_pic_icon.png')
                ),
              )),
        ],
      ),
    );
  }
}
