import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebace1/DatabaseService/note_searvice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
        'title': notectr.text,
        'note': textEditingController.text,
        'time': FieldValue.serverTimestamp()
      };
      await noteSearvice.Notesave(data);
      Fluttertoast.showToast(msg: 'Note saved');
      Navigator.pop(ctx);
    } else {
      Fluttertoast.showToast(msg: 'Enter titile');
    }
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
