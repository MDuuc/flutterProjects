import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //acess product in shop
    final products = context.watch<Shop>().shop;
    
    return Scaffold(
      appBar: AppBar(title: Text("Shop Page"),
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25,),
        //shop tile
        Center(
          child: Text("Pick from a selected list of premium products",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          )),
          
        
        //shop subtiltle

        //product list
        SizedBox(
          height: 550,          
          child: ListView.builder(
          padding: const EdgeInsets.all(15),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index){
            //get each individual product from shop
            final product = products[index];
          
            //return as a product title UI
            return MyProductTile(product: product);
          
                }),
        ),

        ]

      )
    );
  }
}