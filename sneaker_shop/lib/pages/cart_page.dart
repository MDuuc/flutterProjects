import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/component/cart_item.dart';
import 'package:sneaker_shop/model/cart.dart';
import 'package:sneaker_shop/model/shoes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Heading
                    Text(
                        'My Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                        ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.getUserCart().length,
                            itemBuilder: (context, index) {
                                // Get individual shoes
                                Shoes individualShoes = value.getUserCart()[index];

                                // Return the cart items
                                return CartItem(shoes: individualShoes);
                            },
                        ),
                    ),
                ],
            ),
        ),
    );
}

}