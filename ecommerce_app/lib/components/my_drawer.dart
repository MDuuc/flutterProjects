import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
                        //drawer header: logo
            DrawerHeader(child:             
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.onPrimary,
            ),),

            const SizedBox(height: 25),
          //shop title
          MyListTile(text: "Shop", icon: Icons.home, onTap: () =>Navigator.pop(context)),
          MyListTile(text: "Cart", icon: Icons.shopping_cart, onTap: () => Navigator.pushNamed(context, '/cart_page')),
            ],
            
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(text: "Exit", icon: Icons.logout, onTap: () => Navigator.pushNamed(context, '/intro_page')),
          ),


          //cart title

          //exist shop title

        ],
      ),
    );
  }
}