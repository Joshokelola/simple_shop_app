import 'package:flutter/material.dart';

import 'pages/product_page.dart';
import 'pages/checkout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ProductPage(),
      const CheckoutPage(), // Add the CheckoutPage to the list
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_selectedIndex == 0 ? 'Products' : 'Checkout'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Checkout'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey[600],
          onTap: _onItemTapped,
        ),
        body: pages[_selectedIndex],
      ),
    );
  }
}
