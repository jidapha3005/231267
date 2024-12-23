import 'package:flutter/material.dart';
import 'package:product_detail_pageapp/homepage.dart';
import 'package:product_detail_pageapp/product_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>const Homepage(),
        '/ptd_dt':(context)=> const ProductDetail()
      },
    );
  }
}
