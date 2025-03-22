import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'activity2.dart';
import 'fav_page.dart';
import 'signup_activity.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7CA74),
      resizeToAvoidBottomInset: true,  // Ensure the UI adjusts for the keyboard
      body: Stack(  // Use Stack to position elements
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(  // Allows the content to scroll when the keyboard appears
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // Login Title
                  Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Email input field
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  // Password input field
                  TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Login button
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFEB3B),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  // Sign up and forgot password (optional links)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpActivity()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Cancel button (top-left corner)
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                // Navigate to SecondActivity when the cancel image is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondActivity()),
                );
              },
              child: Image.asset(
                'assets/btn_dialog.png',  
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login function to verify credentials
  void _login() async {
    String userEmail = _userController.text;
    String userPass = _passController.text;

    if (userEmail.isEmpty || userPass.isEmpty) {
      _showToast('Please fill in the login info');
    } else if (userEmail == 'admin' && userPass == 'admin') {
      // Save the login status
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true); // Set login status as true

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FavActivity()),
      );
    } else {
      _showToast('Invalid credentials');
    }
  }

  // Function to show toast message
  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
