import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebace1/DatabaseService/note_searvice.dart';
import 'package:flutter_firebace1/view/home/add%20note.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteControlar extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController notectr = TextEditingController();


  ScrollController scrollController = ScrollController();
  final scrollPosition = 0.0.obs;
  NoteSearvice noteSearvice = NoteSearvice();

  final notedata = [].obs;
  final isloding = false.obs;
  noteget() async {
    isloding.value = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    String usarid = await sp.getString('uid')!;
    var d = await noteSearvice.noteGet(usarid);
    notedata.value = d;
    isloding.value = false;
  }

  Future Notedatasave(BuildContext ctx) async {
    if (notectr.text.length > 1) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      
      var data = {
        'userid': sp.getString('uid'),
        'note': notectr.text,
        'title': textEditingController.text,
        'time': FieldValue.serverTimestamp(),
        'color':pickerColor.value
      };
      await noteSearvice.Notesave(data);
      await noteget();
      notectr.clear();
      textEditingController.clear();
      Fluttertoast.showToast(msg: 'Note saved');
      Navigator.pop(ctx);
    } else {
      Fluttertoast.showToast(msg: 'Enter titile');
    }
  }
  String formatTimestamp(Timestamp timestamp) {
   
    DateTime dateTime = timestamp.toDate();

    
    String formattedTime =
        DateFormat('hh:mm a').format(dateTime);
    String formattedDate = DateFormat('d MMM').format(dateTime); 

 
    return '$formattedTime $formattedDate';
  }
  @override
  void onInit() {
    scrollController.addListener(() {
      scrollPosition.value = scrollController.position.pixels;
      print(scrollPosition.value);
    });
    super.onInit();
  }
}
