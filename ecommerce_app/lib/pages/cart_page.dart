import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});


  //remove Item from cart
    void removeItemFromCar(BuildContext context, Product product){
    //show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text("Remove  this item to your cart"),
        actions: [
          //cance; button
          MaterialButton(onPressed: () => Navigator.pop(context),
          child: Text("Cancle")),
          //yes button
           MaterialButton(onPressed: () =>{
            //pop dialog box
            Navigator.pop(context),

            //add to cart
            context.read<Shop>().removeFromCart(product)
           },
          child: Text("Yes")),         
        ],
      )
    );
  }

  void payButtonPressed (BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Successfull"),
    ));
  }


  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty? const Center(child: Text("Your cart is empty"),) : ListView.builder(
              itemCount: cart.length, // Số lượng sản phẩm trong giỏ hàng
              itemBuilder: (context, index) {
                //get individual item in cart
                final item = cart[index];
                
                //return as a cart title UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toString()}'),
                  trailing: IconButton(onPressed: () => removeItemFromCar(context, item), icon: Icon(Icons.remove)),
                );
              },
            ),
          ),

          //pay button
Padding(
  padding: const EdgeInsets.all(16.0),
  child: ElevatedButton(
    onPressed: () => payButtonPressed(context),
    child: const Text('Pay Now'),
  ),
),

        ],
      ),
    );
  }
}
