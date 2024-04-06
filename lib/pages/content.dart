import 'package:flutter/material.dart';
import 'package:learnhub/pages/cart.dart';


class Mycontent extends StatefulWidget {
  const Mycontent({super.key});

  @override
  State<Mycontent> createState() => _MycontentState();
}

class _MycontentState extends State<Mycontent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          GestureDetector(
                        
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Mycart()));
                        },
                        child: const Icon(Icons.shopping_cart_outlined, size: 35)),
        ],)
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/1708340_7108_5.jpg'),
              SizedBox(height: 19,),
              Text('Flutter & Dart - The Complete Guide [2024 Edition]',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
              Text('A complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps',style: TextStyle(fontSize: 18),),
              const Row(
                            children: [
                              Text('4.5'),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text('Created by Academind by Maximilian',style: TextStyle(fontSize: 18),),
                          SizedBox(height: 10,),
                          Text('Last Updated on 02/2024'),
                          Text('English'),
                          SizedBox(height: 15,),
                          Text('449'),
                          ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    minimumSize: MaterialStateProperty.all(const Size(400, 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                  onPressed: () {
                    // Add logic to handle checkout button press
                   
                  },
                  child: const Text('Buy Now',style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.grey),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                      minimumSize: MaterialStateProperty.all(const Size(190, 50)),
                    ), 
                    child: const Text('Go to Cart',style: TextStyle(color: Colors.black),),
                    ),
                    OutlinedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.grey),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                       minimumSize: MaterialStateProperty.all(const Size(190, 50)),
                    ), 
                    child: const Text('Add to Wishlist',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Text('What you’ll learn',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text('Learn Flutter and Dart from the ground up, step-by-step',style: TextStyle(fontSize: 17),),
                Text('Build engaging native mobile apps for both Android \nand iOS',style: TextStyle(fontSize: 17),),
                Text('Use features like Google maps,the device camera,\nauthentication and much more!',style: TextStyle(fontSize: 17),),
                const SizedBox(height: 15,),
                Text('Show more',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text('Curriculum',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                Text('16 sections. 303 lectures. 30h total length',style: TextStyle(fontSize: 17),
                ),
                
                const SizedBox(height: 15,),
                
              
       



            ],
          ),
        ),
      ),
    );
  }
}