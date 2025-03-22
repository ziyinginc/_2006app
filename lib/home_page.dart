import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'activity2.dart';  
import 'fav_page.dart';  

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  String? selectedItem;
  bool isLoggedIn = false;  // This will be set based on the login status.

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }
  // Check login status from SharedPreferences
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                print("Search text: $text");
              },
            ),
          ),

          // Dropdown menu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedItem,
              hint: Text('Select an option'),
              items: ['Car', 'Truck', 'Motorcycle']
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
                print("Selected: $selectedItem");
              },
            ),
          ),
        ],
      ),

      // BottomAppBar (Bottom navigation)
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF5D3FD3), // Set bottom app bar color
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Centers the icons in the middle
            children: [
              GestureDetector(
                onTap: () {
                  // Action for Home button (implement if needed)
                },
                child: Image.asset(
                  'assets/yellowhome.png',  // Home icon
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(width: 250),  // Space between the two icons (adjustable)
              GestureDetector(
                onTap: () {
                  // Check login status and navigate accordingly
                  if (isLoggedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavActivity()),  // Navigate to FavActivity
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondActivity()),  // Navigate to SecondActivity
                    );
                  }
                },
                child: Image.asset(
                  'assets/yellowheart.png',  // Yellow heart icon
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
