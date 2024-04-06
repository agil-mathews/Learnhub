import 'package:flutter/material.dart';
import 'package:learnhub/pages/cart.dart';

class MySearch extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MySearch({Key? key});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
           
                    children: [
                      Expanded(
                        child: Container(
                          height: 40.0,
                          // Set a max width for the search bar
                          constraints: const BoxConstraints(maxWidth: 340),
                          child: const SearchBar(
                              leading: Icon(Icons.search), hintText: 'Search'),
                        ),
                      ),
                      GestureDetector(
                        
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Mycart()));
                        },
                        child: const Icon(Icons.shopping_cart_outlined, size: 35)),
                    ],
                  ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18.0),
        child: ListView(
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text(
                    'Top Searches',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Wrap(children: [
                    Chip(shape: StadiumBorder(), label: Text('Python')),
                    Chip(shape: StadiumBorder(), label: Text('Java')),
                    Chip(shape: StadiumBorder(), label: Text('Excel')),
                    Chip(shape: StadiumBorder(), label: Text('Javascript')),
                    Chip(shape: StadiumBorder(), label: Text('AWS')),
                    Chip(shape: StadiumBorder(), label: Text('Power Bi')),
                    Chip(shape: StadiumBorder(), label: Text('React')),
                    Chip(shape: StadiumBorder(),  label: Text('Digital Marketing')),
                    Chip(shape: StadiumBorder(), label: Text('C#')),
                    Chip(shape: StadiumBorder(), label: Text('SQL')),
                    Chip(shape: StadiumBorder(), label: Text('SAP')),
                    Chip(shape: StadiumBorder(), label: Text('Photoshop')),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 5),
                  child: Text(
                    'Browse Categories',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text(
                          'Development',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Business',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Digital Marketing',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Accounting',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Office Productivity',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Design',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Lifestyle',
                          style:  TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Photography & Video',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text(
                          'Datascience',
                          style: 
                               TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
