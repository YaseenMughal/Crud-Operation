import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/service/api_services.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Operation"),
      ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<ProductModel> productdata = snapshot.data;
            return ListView.builder(
              itemCount: productdata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    leading: Icon(Icons.storage_outlined),
                    trailing: Text(
                      "\$ ${productdata[index].price}",
                      style: textStyle(fontsize: 15, color: Colors.black),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

textStyle({double? fontsize, Color? color}) {
  return TextStyle(fontSize: fontsize, color: color);
}
