// ignore_for_file: file_names, camel_case_types
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parshwapolymers/api/apiController.dart';
import 'package:parshwapolymers/models/product.dart';
import 'package:parshwapolymers/models/productlines.dart';
import 'package:parshwapolymers/widgets/customTextFormField.dart';
import 'package:http/http.dart' as http;

class editProductPage extends StatefulWidget {
  final String oid;
  const editProductPage({Key? key, required this.oid}) : super(key: key);

  @override
  State<editProductPage> createState() => _editProductPageState();
}

class _editProductPageState extends State<editProductPage> {
  bool initialimage = true;
  XFile? image;
  TextEditingController labelController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  late Future<List<ProductLines>> futureProductLines;
  List<ProductLines> listofproductLines = [];
  late Future<Product> futureproduct;
  Product? product;
  String dropDownValue = "";
  final _formKey = GlobalKey<FormState>();
  late Future<http.StreamedResponse>? res;

  void getList() async {
    listofproductLines = await futureProductLines;
    product = await futureproduct;
    setState(() {
      labelController.text = product!.name;
      materialController.text = product!.material;
      image = XFile(product!.image['data']);
      dropDownValue = product!.title;
    });
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
      initialimage = false;
    });
  }

  @override
  void initState() {
    futureProductLines = fetchTitlesFromProductLines();
    futureproduct = fetchProductById(widget.oid);
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return listofproductLines.isEmpty && product == null
        ? Center(
            child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ))
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: const Text('Add Product')),
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            imagePicker(context),
                            const SizedBox(height: 30),
                            customTextFormField(
                                context: context,
                                label: "Product Name",
                                controller: labelController,
                                validator: "Please enter product name"),
                            const SizedBox(height: 30),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton(
                                    isExpanded: true,
                                    value: dropDownValue,
                                    items: listofproductLines.map((e) {
                                      return DropdownMenuItem(
                                        value: e.title,
                                        child: Text(e.title),
                                      );
                                    }).toList(),
                                    enableFeedback: true,
                                    elevation: 10,
                                    hint: const Text("Select Product Line"),
                                    dropdownColor: Theme.of(context).cardColor,
                                    onChanged: (value) {
                                      setState(() {
                                        dropDownValue = value.toString();
                                      });
                                    })),
                            const SizedBox(height: 30),
                            customTextFormField(
                                context: context,
                                label: "Product Material",
                                controller: materialController,
                                validator: "Please enter product material"),
                            Center(
                                child: SizedBox(
                              width: 300,
                              height: 100,
                              child: Row(children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Theme.of(context).primaryColorLight),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (image == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text("Please select an image"),
                                        ));
                                      } else {
                                        if (!initialimage) {
                                          res = editProduct(
                                              widget.oid,
                                              context,
                                              labelController,
                                              materialController,
                                              dropDownValue,
                                              image!);
                                          res == null
                                              ? const ScaffoldMessenger(
                                                  child: SnackBar(
                                                  content: Text("Please wait"),
                                                ))
                                              : res!.then((value) {
                                                  if (value.statusCode == 200) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content:
                                                          Text("Product Added"),
                                                    ));
                                                    Navigator.pop(context);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content: Text(
                                                          "Product not Added"),
                                                    ));
                                                  }
                                                });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "Must Change Image Or Select Same Again"),
                                          ));
                                        }
                                      }
                                    } else {
                                      if (kDebugMode) {
                                        print("not validated");
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Theme.of(context).cardColor),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                OutlinedButton(
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                            Theme.of(context)
                                                .primaryColorLight),
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Color(0xff5075b2)))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ))
                              ]),
                            ))
                          ],
                        ))),
              ),
            ),
          );
  }

  Center imagePicker(BuildContext context) {
    return Center(
        child: initialimage
            ? InkWell(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
                hoverColor: const Color(0x00000000),
                focusColor: const Color(0x00000000),
                splashColor: const Color(0x00000000),
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.memory(base64Decode(image!.path),
                        height: 200, width: 200, fit: BoxFit.contain)))
            : InkWell(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
                hoverColor: const Color(0x00000000),
                focusColor: const Color(0x00000000),
                splashColor: const Color(0x00000000),
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.file(File(image!.path),
                        height: 200, width: 200, fit: BoxFit.contain)),
              ));
  }
}
