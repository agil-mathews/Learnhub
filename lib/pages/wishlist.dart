import 'package:flutter/material.dart';


class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Row(
            children: [
              Text(
                'Wishlist',
                style: TextStyle(color: Colors.deepPurple[400]),
              ),
              const Spacer(),
              const Icon(Icons.shopping_cart_outlined, size: 35),
            ],
          ),
        ),
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Want to save something for later?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Text('Your Wishlist will go here',style: TextStyle(fontSize: 19),),
        ],
      ),
    );
  }
}