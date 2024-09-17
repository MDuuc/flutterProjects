
import 'package:flutter/material.dart';
import 'package:sneaker_shop/model/shoes.dart';

class ShoesTile extends StatelessWidget {
  Shoes shoes;
  void Function()? ontap;
  ShoesTile({super.key, required this.shoes, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //shoes pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoes.imagePath)),
          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              shoes.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //price + detai;
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // can le trai
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //shoes name
                    Text(
                      shoes.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
            
                    //price
                    Text('\$'+shoes.price, style: const TextStyle(color: Colors.grey),)
                  ],
                ),
                //plus button
                GestureDetector(
                  onTap: ontap,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      )
                    ),
                    child: Icon(Icons.add, color: Colors.white,)),
                )
              ],
            ),
          )
          // button to add to cart

        ],
      ),
    );
  }
}