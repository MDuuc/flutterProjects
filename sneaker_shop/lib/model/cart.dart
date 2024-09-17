import 'package:flutter/material.dart';
import 'package:sneaker_shop/model/shoes.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoes> shopShoes=[
    Shoes("Zoom Fly", '246', "lib/img/shoes.png", "Cool"),
    Shoes("Zoom Freak", '223', "lib/img/shoes2.png", "Nicce"),
    Shoes("Fly Freak", '123', "lib/img/shoes3.png", "Beutiful"),
    Shoes("Hard Freak", '452', "lib/img/shoes4.png", "WTFF"),

  ];
  //list of items in user cart
  List<Shoes> userCart=[];

  // get list of shoes for sale
  List<Shoes> getShoesList(){
    return shopShoes;
  }

  //get cart
  List<Shoes> getUserCart(){
    return userCart;
  }

  //add itesm to cart
  void addItemCart(Shoes shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemCart(Shoes shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}