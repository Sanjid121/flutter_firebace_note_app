import 'package:flutter_firebace1/controller/authController.dart';
import 'package:flutter_firebace1/controller/note_controlar.dart';

import 'package:get/get.dart';

class ControllerInit {
  static Init() {
    Get.put(Authcontroller()); 
    Get.put(NoteControlar());
  }

}
