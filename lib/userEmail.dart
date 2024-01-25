import 'package:flutter/material.dart';

class UserEmail extends StatefulWidget {
  @override
  _UserEmail createState() => _UserEmail();
}

class _UserEmail extends State<UserEmail> {
  final TextEditingController _newEmailController = TextEditingController(text: "adelfa@gmail.com");
  final TextEditingController _confirmEmailController = TextEditingController(text: "adelfa@gmail.com");
  bool _isEmailMatching = true;

  void _saveEmailChanges() {
    // Here you would usually interact with the database or your state management solution
    String newEmail = _newEmailController.text;
    String confirmEmail = _confirmEmailController.text;
    if (newEmail == confirmEmail) {
      // Proceed to save the email
      print('Save the email: $newEmail');
      setState(() {
        _isEmailMatching = true;
      });
    } else {
      // Handle the error
      print('The emails do not match');
      setState(() {
        _isEmailMatching = false;
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
          'Email', // Changed from 'Full Name' to 'Email'
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
                  'Email', // Changed from 'Full Name' to 'Email'
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
                ),
                SizedBox(height: 8),
                Text(
                  _newEmailController.text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF196DFF)),
                ),
                SizedBox(height: 64),
                TextFormField(
                  controller: _newEmailController,
                  decoration: InputDecoration(
                    labelText: 'New Email', // Changed from 'New Full Name' to 'New Email'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isEmailMatching ? "Emails don't match" : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmEmailController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Email', // Changed from 'Confirm Full Name' to 'Confirm Email'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isEmailMatching ? "Emails don't match" : null,
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
                    onPressed: _saveEmailChanges, // Changed from _saveFullNameChanges to _saveEmailChanges
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
    _newEmailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }
}
