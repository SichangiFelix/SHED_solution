import 'package:flutter/material.dart';
import 'package:project/src/features/home/screens/page_list.dart';

class HomeScreen extends StatefulWidget {

  static const String screenRoute = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: homePages,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: "Materials"),
          BottomNavigationBarItem(icon: Icon(Icons.storefront),label: "Marketplace"),
        ],
      ),
    );
  }
}
