import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


class ColorPick extends StatefulWidget {
  final Function(String) getColor;
  final String subjectColor;
  ColorPick(this.subjectColor, this.getColor);
  @override
  _ColorPickState createState() => _ColorPickState();

}

class _ColorPickState extends State<ColorPick> {
  Color color = Color(0xffcddc39);
  String  hex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(backgroundColor: color,),
      onTap: () {
        _showDialog();
      },
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Escolha uma cor!'),
          content: SingleChildScrollView(
              child: MaterialColorPicker(
                  onColorChange: (Color color) {

                    setState(() => this.color = color);

                     hex = '0x${color.value.toRadixString(16)}';
                      widget.getColor(hex);
                  },
                  selectedColor: Colors.red
              )
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Pronto'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}