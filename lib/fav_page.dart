import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'activity2.dart';  // SecondActivity (used if not logged in)
import 'home_page.dart';  // MainActivity (used for the home screen)

class FavActivity extends StatefulWidget {
  @override
  _FavActivityState createState() => _FavActivityState();
}

class _FavActivityState extends State<FavActivity> {
  // The selected item for the dropdown
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header text
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF5D3FD3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                children: [
                  Text(
                    'Favourites',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  // Heart image (ImageView)
                  Image.asset(
                    'assets/redheart.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),

            // Spinner equivalent (DropdownButton)
            DropdownButton<String>(
              value: selectedItem,
              hint: Text('Select an option'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
                // Show a toast-like message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: $newValue')),
                );
              },
              items: <String>['Car', 'Truck', 'Motorcycle']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 40),  // Space between Dropdown and Log Out button

            // Expanded space to push Log Out button to the bottom
            Spacer(),

            // Log Out button (TextButton)
            GestureDetector(
              onTap: () async {
                // Set loggedIn status to false using SharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', false);

                // Navigate to the second activity (SecondActivity)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SecondActivity()),
                      (Route<dynamic> route) => false,  // Remove all previous routes (log out completely)
                );
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF5D3FD3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // BottomAppBar (Bottom navigation)
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF5D3FD3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Center icons horizontally
            children: [
              GestureDetector(
                onTap: () {
                  // Action for Home button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainActivity()),
                  );
                },
                child: Image.asset(
                  'assets/yellowhome.png',  // Home icon
                  width: 200,  // Adjusted width for a cleaner look
                  height: 200, // Adjusted height for a balanced size
                ),
              ),
              SizedBox(width: 250),  // Space between the two icons (adjustable)
              GestureDetector(
                onTap: () {
                  // Handle heart button click if necessary
                },
                child: Image.asset(
                  'assets/yellowheart.png',  // Yellow heart icon
                  width: 200,  // Adjusted width for a cleaner look
                  height: 200, // Adjusted height for a balanced size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
