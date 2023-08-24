import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parshwapolymers/models/productlines.dart';
import 'package:parshwapolymers/pages/home.dart';
import 'models/product.dart';
import 'themes/theme.dart';

void main() {
  runApp(const ParshwaPolymersApp());
}

const String proxyurl = 'http://localhost:8898/api/parshwapolymers';

List<ProductLines> productLinesFromList(List<dynamic> list) {
  final List<ProductLines> returnlist = [];
  for (var i = 0; i < list.length; i++) {
    returnlist.add(ProductLines.fromMap(list[i] as Map<String, dynamic>));
  }
  return returnlist;
}

List<Product> productFromList(List<dynamic> list) {
  final List<Product> returnlist = [];
  for (var i = 0; i < list.length; i++) {
    returnlist.add(Product.fromMap(list[i] as Map<String, dynamic>));
  }
  return returnlist;
}

class ParshwaPolymersApp extends StatelessWidget {
  const ParshwaPolymersApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
            child: Center(child: Image.asset("assets/images/logo.png"))));
  }
}
