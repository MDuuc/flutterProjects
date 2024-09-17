import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/component/shoe_tile.dart';
import 'package:sneaker_shop/model/cart.dart';
import 'package:sneaker_shop/model/shoes.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoes to cart
  void addShoesToCart (Shoes shoes){
    Provider.of<Cart>(context, listen: false).addItemCart(shoes);

    //alert the user, shoes successfully added
    showDialog(context: context, builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),      title: Text('Succesfully added'),
      content: Text('Check your cart'),
    ));

  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<Cart>( builder:(context, value, child) =>  
       Column(
        children: [
          //search bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding:EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8)
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(Icons.search, color: Colors.grey,),
              ],
            ) ,
          ),
      
          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'Everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
      
          //hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hot Picks 🔥', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text('See all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
            
              ],
              ),
          ),
          
          const SizedBox(height: 10,),
      
      // list shoes for sale
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              //create a shoe
              Shoes shoes = value.getShoesList()[index];
              // return shoes
              return ShoesTile(
                shoes: shoes,
                ontap: ()=>addShoesToCart(shoes),
              );
            })),
        ],
      ),
    );
  }
}