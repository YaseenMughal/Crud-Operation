import 'package:flutter/material.dart';
import 'package:node_tutorial/service/api_services.dart';
import 'widget.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  bool _loading = false;

  TextEditingController tfcname = TextEditingController();
  TextEditingController tfcprice = TextEditingController();
  TextEditingController tfcdesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Operation")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textField(tfcname, "Product Name.."),
            textField(tfcprice, "Product Price.."),
            textField(tfcdesc, "Product Description.."),
            const SizedBox(height: 30),
            _loading
                ? const CircularProgressIndicator()
                : InkWell(
                    onTap: () async {
                      if (tfcname.text.isEmpty || tfcprice.text.isEmpty || tfcdesc.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text("Please enter your product details!")));
                      } else {
                        setState(() {
                          _loading = true;
                        });
                        var data = {
                          "productName": tfcname.text,
                          "productPrice": tfcprice.text,
                          "productDescription": tfcdesc.text,
                        };
                        await Api.addProduct(data);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Your product added!")));
                        setState(() {
                          _loading = false;
                        });
                      }
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
                  ),
          ],
        ),
      ),
    );
  }
}
