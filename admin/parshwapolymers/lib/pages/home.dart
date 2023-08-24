import 'package:flutter/material.dart';
import 'package:parshwapolymers/pages/ProductPage.dart';
import 'package:parshwapolymers/pages/WebsitePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page = const ProductPage();
    switch (selectedIndex) {
      case 0:
        page = const ProductPage();
        break;
      case 1:
        page = const WebsitePage();
        break;
    }
    return Scaffold(
      key: scaffoldKey,
      drawer: customDrawer(),
      appBar: AppBar(title: const Text('Parshwa Polymers')),
      body: page,
    );
  }

  Drawer customDrawer() {
    return Drawer(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: NavigationRail(
          extended: true,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                label: Text("Products")),
            NavigationRailDestination(
                icon: Icon(Icons.web), label: Text("Website"))
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
              scaffoldKey.currentState!.closeDrawer();
            });
          },
        ),
      ),
    ));
  }
}
