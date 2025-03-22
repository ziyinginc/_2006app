import 'package:flutter/material.dart';
import 'activity2.dart'; 
import 'fav_page.dart'; 

class SignUpActivity extends StatefulWidget {
  @override
  _SignUpActivityState createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7CA74), 
      resizeToAvoidBottomInset: true,  // Ensures that the layout adjusts when the keyboard appears
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
                  // Sign Up Title
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Email label and input field
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D3FD3),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      filled: true,  // Make the background white
                      fillColor: Colors.white,  
                      contentPadding: EdgeInsets.all(10),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  // Password label and input field
                  Text(
                    'Password:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D3FD3),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      filled: true,  // Make the background white
                      fillColor: Colors.white,  
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(height: 40),
                  // SignUp button
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFEB3B), // Button color (yellow)
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    child: Text('Sign Up'),
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

  // Sign Up logic
  void _signUp() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showToast('Please fill in the required info');
    } else if (email == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondActivity()),
      );
    } else {
      _showToast('Invalid credentials');
    }
  }

  // Function to show a Toast message
  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
