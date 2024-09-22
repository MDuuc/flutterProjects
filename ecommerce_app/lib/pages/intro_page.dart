import 'package:ecommerce_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.onPrimary,
            ),

            const SizedBox(height: 25,),
            
            //title
           const Text("Minimal Shop", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),

            const SizedBox(height: 10,),

            //subtile
            Text("Premium Quallity Products", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),

            const SizedBox(height: 25,),

            //button
            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'), child: const Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ),
    );
  }
}