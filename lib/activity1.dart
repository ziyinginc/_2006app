import 'package:flutter/material.dart';
import 'dart:async';  // To use Future.delayed
import 'home_page.dart';

class Activity1 extends StatefulWidget {
  @override
  _Activity1State createState() => _Activity1State();
}

class _Activity1State extends State<Activity1> {
  @override
  void initState() {
    super.initState();
    // Start the timer and transition to the next activity after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainActivity()), // Replace with the next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7CA74), // Background color #E7CA74
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Yellow Car Image (replace the asset path if needed)
            Image.asset(
              'assets/yellowcar.png', // Only one image now
              width: 257,  // Equivalent to 257dp in your XML
              height: 309, // Equivalent to 309dp in your XML
            ),
            SizedBox(height: 30), // Add space between the images

            // Text below the image
            Text(
              'FIND CARPARKS',
              style: TextStyle(
                color: Color(0xFF5D3FD3), // Equivalent to #5D3FD3 in your XML
                fontSize: 35, // Equivalent to 35sp in your XML
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            // ProgressBar equivalent in Flutter
            CircularProgressIndicator(
              strokeWidth: 6, // Optional to adjust thickness of the progress bar
            ),
          ],
        ),
      ),
    );
  }
}

