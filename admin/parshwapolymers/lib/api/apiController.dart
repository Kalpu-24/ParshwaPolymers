// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../models/product.dart';
import '../models/productlines.dart';

Future<http.StreamedResponse> sendData(
    BuildContext context,
    TextEditingController labelController,
    TextEditingController materialController,
    String dropDownValue,
    XFile image) async {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Please wait"),
  ));
  var request =
      http.MultipartRequest('POST', Uri.parse('$proxyurl/products/add'));
  request.fields.addAll({
    'name': labelController.text,
    'title': dropDownValue,
    'material': materialController.text
  });
  request.files.add(await http.MultipartFile.fromPath('image', image.path));
  var response = await request.send();
  return response;
}

Future<List<ProductLines>> fetchTitlesFromProductLines() async {
  final response =
      await http.get(Uri.parse('$proxyurl/productlines/getAllProductLines'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<ProductLines> map = productLinesFromList(data);
    return map;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Product>> fetchProductsFromTitle() async {
  final response =
      await http.get(Uri.parse('$proxyurl/products/getAllProducts'));
  if (response.statusCode == 200) {
    String resStr = response.body.toString();
    String newStr = resStr.replaceAll("idforapp", "id");
    final List<dynamic> data = jsonDecode(newStr);
    final List<Product> map = productFromList(data);
    return map;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Product> fetchProductById(String oid) async {
  final response = await http.get(Uri.parse("$proxyurl/products/getById/$oid"));
  if (response.statusCode == 200) {
    String resStr = response.body.toString();
    String newStr = resStr.replaceAll("idforapp", "id");
    final Map<String, dynamic> data = jsonDecode(newStr);
    final Product map = Product.fromJson(Product.fromMap(data).toJson());
    return map;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<http.StreamedResponse> editProduct(
    String oid,
    BuildContext context,
    TextEditingController labelController,
    TextEditingController materialController,
    String dropDownValue,
    XFile image) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$proxyurl/products/edit/$oid'));
  request.fields.addAll({
    'name': labelController.text,
    'title': dropDownValue,
    'material': materialController.text
  });
  request.files.add(await http.MultipartFile.fromPath('image', image.path));
  var response = await request.send();
  return response;
}

Future<http.Response> deleteProduct(String oid) async {
  var response = await http.delete(Uri.parse('$proxyurl/products/delete/$oid'));
  return response;
}
