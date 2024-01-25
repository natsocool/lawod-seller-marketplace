import 'package:flutter/material.dart';

class UserPhoneNumber extends StatefulWidget {
  @override
  _UserPhoneNumber createState() => _UserPhoneNumber();
}

class _UserPhoneNumber extends State<UserPhoneNumber> {
  final TextEditingController _newPhoneNumberController = TextEditingController(text: "09876543210");
  final TextEditingController _confirmPhoneNumberController = TextEditingController(text: "09876543210");
  bool _isPhoneNumberMatching = true;

  void _savePhoneNumberChanges() {
    // Here you would usually interact with the database or your state management solution
    String newPhoneNumber = _newPhoneNumberController.text;
    String confirmPhoneNumber = _confirmPhoneNumberController.text;
    if (newPhoneNumber == confirmPhoneNumber) {
      // Proceed to save the phone number
      print('Save the phone number: $newPhoneNumber');
      setState(() {
        _isPhoneNumberMatching = true;
      });
    } else {
      // Handle the error
      print('The phone numbers do not match');
      setState(() {
        _isPhoneNumberMatching = false;
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
          'Phone Number', // Changed from 'Email' to 'Phone Number'
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
                  'Phone Number', // Changed from 'Email' to 'Phone Number'
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
                ),
                SizedBox(height: 8),
                Text(
                  _newPhoneNumberController.text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF196DFF)),
                ),
                SizedBox(height: 64),
                TextFormField(
                  controller: _newPhoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'New Phone Number', // Changed from 'New Email' to 'New Phone Number'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isPhoneNumberMatching ? "Phone Numbers don't match" : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPhoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Phone Number', // Changed from 'Confirm Email' to 'Confirm Phone Number'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isPhoneNumberMatching ? "Phone Numbers don't match" : null,
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
                    onPressed: _savePhoneNumberChanges, // Changed from _saveEmailChanges to _savePhoneNumberChanges
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
    _newPhoneNumberController.dispose();
    _confirmPhoneNumberController.dispose();
    super.dispose();
  }
}
