import 'package:flutter/material.dart';

class Mycheckout extends StatefulWidget {
  const Mycheckout({super.key});

  @override
  State<Mycheckout> createState() => _MycheckoutState();
}

class _MycheckoutState extends State<Mycheckout> {

  String dropdownvalue = 'Item 1';    
  
  // List of items in our dropdown menu 
  var items = [     
    'Item 1', 
    'Item 2', 
    'Item 3', 
    'Item 4', 
    'Item 5', 
  ]; 

  int selectedOption =1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Checkout'),
              const Text('Billing Address'),
              const Text('Country'),
              DropdownButton( 
                    
                  // Initial Value 
                  value: dropdownvalue, 
                    
                  // Down Arrow Icon 
                  icon: const Icon(Icons.keyboard_arrow_down),     
                    
                  // Array list of items 
                  items: items.map((String items) { 
                    return DropdownMenuItem( 
                      value: items, 
                      child: Text(items), 
                    ); 
                  }).toList(), 
                  // After selecting the desired option,it will 
                  // change button value to selected value 
                  onChanged: (String? newValue) {  
                    setState(() { 
                      dropdownvalue = newValue!; 
                    }); 
                  }, 
                  // isExpanded: true,
                ),
               const Text('State/ Union Territory'),

                DropdownButton( 
                    
                  // Initial Value 
                  value: dropdownvalue, 
                    
                  // Down Arrow Icon 
                  icon: const Icon(Icons.keyboard_arrow_down),     
                    
                  // Array list of items 
                  items: items.map((String items) { 
                    return DropdownMenuItem( 
                      value: items, 
                      child: Text(items), 
                    ); 
                  }).toList(), 
                  // After selecting the desired option,it will 
                  // change button value to selected value 
                  onChanged: (String? newValue) {  
                    setState(() { 
                      dropdownvalue = newValue!; 
                    }); 
                  }, 
                  // isExpanded: true,
                ),
                const Text('LearnHub is required by law to collect applicable transaction taxes for purchases made in certain tax jurisdictions.'),
                const Text('Payment Method'),
                Container(
                  width: 405,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: Colors.black, // Set the color of the border
                      // width: 2.0, 
                    ),
                  ),
                  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    ListTile(
      title: const Text('Option 1'),
      leading: Radio<int>(
        value: 1,
        groupValue: selectedOption,
        activeColor: Colors.red, // Change the active radio button color here
        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
        splashRadius: 20, // Change the splash radius when clicked
        onChanged: (int? value) {
          setState(() {
            selectedOption = value!;
          });
        },
      ),
      iconColor: Colors.cyan,
    ),
    const Divider(),
    ListTile(
      title: const Text('Option 2'),
      leading: Radio<int>(
        value: 2,
        groupValue: selectedOption,
        activeColor: Colors.blue, // Change the active radio button color here
        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
        splashRadius: 25, // Change the splash radius when clicked
        onChanged: (int? value) {
          setState(() {
            selectedOption = value!;
          });
        },
      ),
    ),
    const Divider(),
    ListTile(
      title: const Text('Option 2'),
      leading: Radio<int>(
        value: 3,
        groupValue: selectedOption,
        activeColor: Colors.blue, // Change the active radio button color here
        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
        splashRadius: 25, // Change the splash radius when clicked
        onChanged: (int? value) {
          setState(() {
            selectedOption = value!;
          });
        },
      ),
    ),
    const Divider(),
    ListTile(
      title: const Text('Option 2'),
      leading: Radio<int>(
        value: 4,
        groupValue: selectedOption,
        activeColor: Colors.blue, // Change the active radio button color here
        fillColor: MaterialStateProperty.all(Colors.blue), // Change the fill color when selected
        splashRadius: 25, // Change the splash radius when clicked
        onChanged: (int? value) {
          setState(() {
            selectedOption = value!;
          });
        },
      ),
    ),

  ],
),
                ),
     const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total:'),
        Text('Rs.449'),
      ],
     ),
     const Text('By completing your purchase you agree to these Terms of Service'),

     Container(
            // color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    minimumSize: MaterialStateProperty.all(const Size(350, 50)),
                  ),
                  onPressed: () {
                    // Add logic to handle checkout button press
                   
                  },
                  child: const Text('Complete Checkout',style: TextStyle(color: Colors.white),),
                ),
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