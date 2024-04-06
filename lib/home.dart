import 'package:flutter/material.dart';
import 'package:learnhub/pages/account.dart';
import 'package:learnhub/pages/content.dart';
import 'package:learnhub/pages/mylearning.dart';
import 'package:learnhub/pages/search.dart';
import 'package:learnhub/pages/wishlist.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MySearch(),
    Mylearning(),
    MyWishlist(),
    MyAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: _selectedIndex == 0
            ? const MyHomeContent()
            : _widgetOptions[_selectedIndex - 1],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[400],
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyHomeContent extends StatefulWidget {
  const MyHomeContent({super.key});

  @override
  State<MyHomeContent> createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    // Customize the content of your home page here
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset('assets/79132090_m_normal_none.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'A world of learning  from ₹449',
                  style: TextStyle(
                      fontSize: 45, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Expand your horizons with learning that's worldwide",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Trending Courses',
                  style:TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w500),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mycontent(),));
                      },
                      child: Column(
                        
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewWidget(),
                          ),
                          const Text(
                              'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                          const Text('Academind by Maximillian'),
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
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \nGuide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Top Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Wrap(
                          spacing: 8.0,
                          children: [
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Python',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Java',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Excel',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Javascript',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'AWS',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Power Bi',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing: 8.0,
                          children: [
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'React',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Digital Marketing',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'C#',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'SQL',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'SAP',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Chip(
                                shape: StadiumBorder(),
                                label: Text(
                                  'Photoshop',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular Among Development',
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w500),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \nGuide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 405,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Set the color of the border
                      width: 2.0, // Set the width of the border
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Text('Top Companies Trust LearnHub',style: TextStyle(fontSize: 25),),
                      const SizedBox(height: 10.0,),
                       Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/Box,_Inc._logo.svg.png',
                        width: 100,
                        height: 80,),
                      ),
                      Image.asset('assets/Box,_Inc._logo.svg.png',
                        width: 100,
                        height: 80,),
                        Image.asset('assets/png-transparent-nasdaq-composite-nasdaq-nordic-exchange-traded-note-market-miscellaneous-blue-angle-thumbnail.png',
                        width: 100,
                        height: 80,),
                      
                    ],
                  ),
                    ],
                  ),
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Trending Courses',
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w500),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \nGuide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/1708340_7108_5.jpg',
                            width: 220,
                            height: 150,
                          ),
                        ),
                        const Text(
                            'Flutter & Dart- The Complete \n Guide [2024 Edition]'),
                        const Text('Academind by Maximillian'),
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
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text('See all'),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/1708340_7108_5.jpg',
      width: 220,
      height: 150,
    );
  }
}
