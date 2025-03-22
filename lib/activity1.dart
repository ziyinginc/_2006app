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
        MaterialPageRoute(builder: (context) => MainActivity()), 
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
              'assets/yellowcar.png', 
              width: 257,  
              height: 309, 
            ),
            SizedBox(height: 30), // Add space between the images

            // Text below the image
            Text(
              'FIND CARPARKS',
              style: TextStyle(
                color: Color(0xFF5D3FD3), 
                fontSize: 35, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            CircularProgressIndicator(
              strokeWidth: 6, // Optional to adjust thickness of the progress bar
            ),
          ],
        ),
      ),
    );
  }
}

