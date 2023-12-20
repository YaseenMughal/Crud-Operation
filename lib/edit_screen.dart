import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/service/api_services.dart';
import 'widget.dart';

class EditScreen extends StatefulWidget {
  final ProductModel data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool _loading = false;

  TextEditingController tfcname = TextEditingController();
  TextEditingController tfcprice = TextEditingController();
  TextEditingController tfcdesc = TextEditingController();

  @override
  void initState() {
    super.initState();
    tfcname.text = widget.data.name.toString();
    tfcprice.text = widget.data.price.toString();
    tfcdesc.text = widget.data.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Operation")),
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
                      setState(() {
                        _loading = true;
                      });
                      await Api.updateProduct(
                        widget.data.id,
                        {
                          "productName": tfcname.text,
                          "productPrice": tfcprice.text,
                          "productDescription": tfcdesc.text,
                          "id": widget.data.id,
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text("Your product added!")));
                      setState(() {
                        _loading = false;
                      });
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
