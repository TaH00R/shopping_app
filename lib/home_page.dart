import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectedFilter;
  int currentPage = 0;

  List<Widget> pages = const [ProductList(),CartPage()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 35,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        backgroundColor: Colors.white,
        items: const [BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Cart' )]
      ),),
    );
  }
}
