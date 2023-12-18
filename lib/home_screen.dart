import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_tutorial/create_screen.dart';
import 'package:node_tutorial/read_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crud Operation"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreen()));
                },
                text: "Create"),
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadScreen()));
                },
                text: "Read"),
            button(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen()));
                },
                text: "Update"),
            button(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen()));
                },
                text: "Delete"),
          ],
        ),
      ),
    );
  }
}

button({required void Function()? onTap, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: ElevatedButton(onPressed: onTap, child: Text(text, style: TextStyle(fontSize: 20))),
  );
}
