import 'package:flutter/material.dart';

class UserFullName extends StatefulWidget {
  @override
  _UserFullName createState() => _UserFullName();
}

class _UserFullName extends State<UserFullName> {
  final TextEditingController _newFullNameController = TextEditingController(text: "Adelfa Baclayon");
  final TextEditingController _confirmFullNameController = TextEditingController(text: "Adelfa Baclayon");
  bool _isFullNameMatching = true;

  void _saveFullNameChanges() {
    // Here you would usually interact with the database or your state management solution
    String newFullName = _newFullNameController.text;
    String confirmFullName = _confirmFullNameController.text;
    if (newFullName == confirmFullName) {
      // Proceed to save the full name
      print('Save the full name: $newFullName');
      setState(() {
        _isFullNameMatching = true;
      });
    } else {
      // Handle the error
      print('The full names do not match');
      setState(() {
        _isFullNameMatching = false;
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
          'Full Name', // Changed from 'Username' to 'Full Name'
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
                  'Full Name', // Changed from 'Username' to 'Full Name'
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
                ),
                SizedBox(height: 8),
                Text(
                  _newFullNameController.text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF196DFF)),
                ),
                SizedBox(height: 64),
                TextFormField(
                  controller: _newFullNameController,
                  decoration: InputDecoration(
                    labelText: 'New Full Name', // Changed from 'New Username' to 'New Full Name'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isFullNameMatching ? "Full Names don't match" : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmFullNameController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Full Name', // Changed from 'Confirm Username' to 'Confirm Full Name'
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isFullNameMatching ? "Full Names don't match" : null,
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
                    onPressed: _saveFullNameChanges, // Changed from _saveChanges to _saveFullNameChanges
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
    _newFullNameController.dispose();
    _confirmFullNameController.dispose();
    super.dispose();
  }
}
