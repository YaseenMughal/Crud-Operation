import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
import 'package:node_tutorial/service/api_services.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController tfcname = TextEditingController();
  TextEditingController tfcprice = TextEditingController();
  TextEditingController tfcdesc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Operation"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textField(tfcname, "Product Name.."),
            textField(tfcprice, "Product Price.."),
            textField(tfcdesc, "Product Description.."),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                var data = {"productName": tfcname.text, "productPrice": tfcprice.text, "productDescription": tfcdesc.text};
                Api.addProduct(data);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.purple[400], borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Create",
                    style: TextStyle(fontSize: 20, color: Colors.purple[100]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

textField(TextEditingController controller, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(hintText: text, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}
