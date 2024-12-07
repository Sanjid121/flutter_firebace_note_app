import 'package:flutter/material.dart';
import 'package:flutter_firebace1/DatabaseService/authService.dart';
import 'package:flutter_firebace1/controller/authController.dart';
import 'package:flutter_firebace1/view/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Drowar extends StatefulWidget {
  const Drowar({Key? key}) : super(key: key);

  @override
  _DrowarState createState() => _DrowarState();
}

Authcontroller nct = Authcontroller();

class _DrowarState extends State<Drowar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/sanjid15.png'),
                  ),
                  text('MD:Sanjid', 24, FontWeight.w400, 0xFFFFFFFF),
                  Container(
                    height: 20,
                    width: 50,
                    child: Text(
                   
                      ''   ,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
            onTap: () async {
              final authCtr = Get.find<Authcontroller>();
              await authCtr.userLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
