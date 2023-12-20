import 'package:flutter/material.dart';
import 'package:node_tutorial/create_screen.dart';
import 'package:node_tutorial/delete_screen.dart';
import 'package:node_tutorial/read_screen.dart';
import 'package:node_tutorial/update_screen.dart';
import 'widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crud Operation"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateScreen()));
                },
                text: "Create"),
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ReadScreen()));
                },
                text: "Read"),
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateScreen()));
                },
                text: "Update"),
            button(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteScreen()));
                },
                text: "Delete"),
          ],
        ),
      ),
    );
  }
}
