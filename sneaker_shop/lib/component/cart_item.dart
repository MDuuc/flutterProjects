import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/model/cart.dart';
import 'package:sneaker_shop/model/shoes.dart';

class CartItem extends StatefulWidget {
  Shoes shoes;
  CartItem({
    super.key,
    required this.shoes
  });
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context, listen: false).removeItemCart(widget.shoes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoes.imagePath),
        title: Text(widget.shoes.name),
        subtitle: Text('\$' + widget.shoes.price),
        trailing: IconButton(onPressed: removeItemFromCart, icon: Icon(Icons.delete)),
      ),
    );
  }
}