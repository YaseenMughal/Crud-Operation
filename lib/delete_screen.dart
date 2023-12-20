import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/service/api_services.dart';

import 'widget.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delete Operation")),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(
              child: Text("Empty Data!", style: textStyle(fontsize: 25, color: Colors.black)),
            );
          } else {
            List<ProductModel> productdata = snapshot.data;
            return ListView.builder(
              itemCount: productdata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text(
                        "${productdata[index].name}",
                        style: textStyle(fontsize: 18, color: Colors.black),
                      ),
                      subtitle: Text(
                        "${productdata[index].description}",
                        style: textStyle(fontsize: 13, color: Colors.grey),
                      ),
                      leading: const Icon(Icons.storage_outlined),
                      trailing: IconButton(
                          onPressed: () async {
                            await Api.deleteProduct(productdata[index].id);
                            productdata.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete))),
                );
              },
            );
          }
        },
      ),
    );
  }
}
