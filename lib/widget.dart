import 'package:flutter/material.dart';

textStyle({double? fontsize, Color? color}) {
  return TextStyle(fontSize: fontsize, color: color);
}

button({required void Function()? onTap, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: ElevatedButton(onPressed: onTap, child: Text(text, style: const TextStyle(fontSize: 20))),
  );
}

Widget textField(TextEditingController controller, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(hintText: text, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}
