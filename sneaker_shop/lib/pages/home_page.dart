import 'package:flutter/material.dart';
import 'package:sneaker_shop/component/bottom_nav_bar.dart';
import 'package:sneaker_shop/pages/cart_page.dart';
import 'package:sneaker_shop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottome nav bar
  int _selectedIndex=0;
  
  // this method will update our selected index
  // when the user tags on the bottom bar
  void navigateBottome(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

// pages to display
final List<Widget> _page =[
  //shop pape
  const ShopPage(),

  // cart page
  const CartPage(),
];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottome(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: Icon(
                Icons.menu,
                color: Colors.black,)
                );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
             Padding(
              padding:  EdgeInsets.only(left: 25, top:50),
                child: 
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                  ),  
              ),

             Padding(
              padding:  EdgeInsets.only(left: 25),
                child: 
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white
                      ),
                      title: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                  ),  
              ),
              ],
            ),

             Padding(
              padding:  EdgeInsets.only(left: 25, bottom: 25),
                child: 
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                  ),  
              ),  
          ],
        ),
      ),
      body: _page[_selectedIndex],
    );
  }
}