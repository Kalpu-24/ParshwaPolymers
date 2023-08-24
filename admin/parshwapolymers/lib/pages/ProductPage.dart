// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parshwapolymers/models/product.dart';
import 'package:parshwapolymers/pages/AddProductPage.dart';
import 'package:parshwapolymers/pages/editProductPage.dart';
import '../api/apiController.dart';
import '../models/productlines.dart';
import '../widgets/customCard.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int gridCount = 2;
  double ratio = 0.5;
  List<ProductLines> listofproductLines = [];
  late Future<List<ProductLines>> futureProductLines;
  List<Product> listofproducts = [];
  late Future<List<Product>> futureProducts;
  void getLists() async {
    listofproductLines = await futureProductLines;
    listofproducts = await futureProducts;
    setState(() {});
  }

  void refreshData() {
    futureProductLines = fetchTitlesFromProductLines();
    futureProducts = fetchProductsFromTitle();
    getLists();
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route =
        MaterialPageRoute(builder: (context) => const AddProductPage());
    Navigator.push(context, route).then(onGoBack);
  }

  void navigateEditPage(String oid) {
    Route route = MaterialPageRoute(
        builder: (context) => editProductPage(
              oid: oid,
            ));
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  void initState() {
    futureProductLines = fetchTitlesFromProductLines();
    futureProducts = fetchProductsFromTitle();
    getLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 388) {
      setState(() {
        gridCount = 1;
        ratio = 0.8;
      });
    } else if (MediaQuery.of(context).size.width > 388 &&
        MediaQuery.of(context).size.width < 528) {
      setState(() {
        gridCount = 1;
        ratio = 1;
      });
    } else if (MediaQuery.of(context).size.width > 528 &&
        MediaQuery.of(context).size.width < 788) {
      setState(() {
        gridCount = 2;
        ratio = 0.7;
      });
    } else if (MediaQuery.of(context).size.width > 788 &&
        MediaQuery.of(context).size.width < 1030) {
      setState(() {
        gridCount = 3;
        ratio = 0.7;
      });
    } else if (MediaQuery.of(context).size.width > 1030 &&
        MediaQuery.of(context).size.width < 1280) {
      setState(() {
        gridCount = 4;
        ratio = 0.7;
      });
    } else if (MediaQuery.of(context).size.width > 1280 &&
        MediaQuery.of(context).size.width < 1530) {
      setState(() {
        gridCount = 5;
        ratio = 0.7;
      });
    } else {
      setState(() {
        gridCount = 6;
        ratio = 0.7;
      });
    }
    return Scaffold(
        body: SafeArea(
            child: listofproductLines.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : SingleChildScrollView(
                    child: Column(children: [
                    Column(
                        children: listofproductLines
                            .map((linesTitle) => ExpansionTile(
                                    title: Text(linesTitle.title),
                                    children: <Widget>[
                                      GridView.count(
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          crossAxisCount: gridCount,
                                          padding: const EdgeInsets.all(20.0),
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: ratio,
                                          children: listofproducts
                                              .where((element) =>
                                                  element.title ==
                                                  linesTitle.title)
                                              .map((products) => customCard(
                                                    editCallback: () {
                                                      navigateEditPage(
                                                          products.id);
                                                    },
                                                    deleteCallback: () {
                                                      refreshData();
                                                      setState(() {});
                                                    },
                                                    products: products,
                                                    context: context,
                                                  ))
                                              .toList())
                                    ]))
                            .toList())
                  ]))),
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add_outlined),
            label: const Text("Add Product"),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: navigateSecondPage));
  }
}
