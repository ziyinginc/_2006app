import 'package:flutter/material.dart';
import 'login_activity.dart';  // Import LoginActivity for navigation
import 'home_page.dart';

class SecondActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are not logged in',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to LoginActivity when the 'Log In' button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginActivity()),
                );
              },
              child: Text('Log In',
                style: TextStyle(
                fontSize: 24,               // Slightly larger font size
                fontWeight: FontWeight.bold, // Make the text bold
              ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF5D3FD3),  // Bottom app bar color (purple)
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Center icons horizontally
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to Home screen when Home icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainActivity()),
                  );
                },
                child: Image.asset(
                  'assets/yellowhome.png',  // Home icon
                  width: 200,  // Adjusted width
                  height: 200, // Adjusted height
                ),
              ),
              SizedBox(width: 250),  // Space between icons
              GestureDetector(
                onTap: () {
                  // Handle heart button click if necessary
                },
                child: Image.asset(
                  'assets/yellowheart.png',  // Yellow heart icon
                  width: 200,  // Adjusted width
                  height: 200, // Adjusted height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
