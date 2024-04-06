import 'package:flutter/material.dart';
import 'package:learnhub/pages/checkout.dart';

class Mycart extends StatefulWidget {
  const Mycart({Key? key}) : super(key: key);

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Your existing content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                const Row(
                  children: [
                    Text('Total : '),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Promotions'),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Apply Coupon'),
                ),
                const Text('Course in cart'),
                Row(
                  
                  children: [
                    Image.asset(
                      'assets/1708340_7108_5.jpg',
                      width: 110,
                      height: 100,
                    ),
                    const SizedBox(width: 20,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Flutter & Dart - The \nComplete Guide\n [2024 Edition]'),
                        Row(
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
                        Row(
                          children: [
                            Text('Remove'),
                            Text('Move to Wishlist')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 80,),
                    Text('Rs.449')
                  ],
                ),
              ],
            ),
          ),
          // Fixed footer
          Container(
            // color: Colors.grey[200],
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    minimumSize: MaterialStateProperty.all(Size(350, 50)),
                  ),
                  onPressed: () {
                    // Add logic to handle checkout button press
                    Navigator.push(context, MaterialPageRoute(builder:(context) => Mycheckout()));
                  },
                  child: Text('Checkout',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
