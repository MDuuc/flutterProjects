import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context){
    //show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart"),
        actions: [
          //cance; button
          MaterialButton(onPressed: () => Navigator.pop(context),
          child: Text("Cancle")),
          //yes button
           MaterialButton(onPressed: () =>{
            //pop dialog box
            Navigator.pop(context),

            //add to cart
            context.read<Shop>().addToCart(product)
           },
          child: Text("Yes")),         
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12),),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                        //product image
          AspectRatio(
            aspectRatio: 1, // turn into square
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)
              ),
              width: double.infinity, //full width parent
              padding: const EdgeInsets.all(25),
              child: Icon(Icons.favorite)),
          ),

          const SizedBox(height: 25),
          //product name
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),

          const SizedBox(height: 12),

          //product description
          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            ),
            ],
          ),

          //product price + add cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text("\$"+product.price.toStringAsFixed(2)),
              //add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(onPressed: ()=> addToCart(context), 
                icon: Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}