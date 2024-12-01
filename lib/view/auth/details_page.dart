import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

Color pickerColor = Color(0xff443a49);

Color currentColor = Color(0xff443a49);

class _DetailsPageState extends State<DetailsPage> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pickerColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: 50,
            color: pickerColor,
          ),
          Container(
              child: AlertDialog(
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
                  SharedPreferences sn = await SharedPreferences.getInstance();
                  sn.getString('pickerColor$pickerColor');
                  print('object');
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
