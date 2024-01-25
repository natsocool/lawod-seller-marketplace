import 'package:flutter/material.dart';

class UserPassword extends StatefulWidget {
  @override
  _UserPassword createState() => _UserPassword();
}

class _UserPassword extends State<UserPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordMatching = true;

  void _savePasswordChanges() {
    // Here you would usually interact with the database or your state management solution
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;
    if (newPassword == confirmPassword) {
      // Proceed to save the password
      print('Save the password: $newPassword');
      setState(() {
        _isPasswordMatching = true;
      });
    } else {
      // Handle the error
      print('The passwords do not match');
      setState(() {
        _isPasswordMatching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // App bar background color
        iconTheme: IconThemeData(color: Color(0xFF4F4F4F)), // Back icon color
        title: Text(
          'Password', // Changed from 'Phone Number' to 'Password'
          style: TextStyle(color: Color(0xFF196DFF), fontWeight: FontWeight.bold), // Title text color and bold
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Password', // Changed from 'Phone Number' to 'Password'
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
                ),
                SizedBox(height: 8),
                Text(
                  _newPasswordController.text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF196DFF)),
                ),
                SizedBox(height: 64),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true, // Hide the password input
                  decoration: InputDecoration(
                    labelText: 'New Password', // Changed from 'New Phone Number' to 'New Password'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isPasswordMatching ? "Passwords don't match" : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true, // Hide the password input
                  decoration: InputDecoration(
                    labelText: 'Confirm Password', // Changed from 'Confirm Phone Number' to 'Confirm Password'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isPasswordMatching ? "Passwords don't match" : null,
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity, // make button width match parent
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF196DFF), // background (button) color
                      foregroundColor: Colors.white, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: _savePasswordChanges, // Changed from _savePhoneNumberChanges to _savePasswordChanges
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Save Changes'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
