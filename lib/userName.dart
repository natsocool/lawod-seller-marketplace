import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  @override
  _UserName createState() => _UserName();
}

class _UserName extends State<UserName> {
  final TextEditingController _newUsernameController = TextEditingController(text: "Gaga's Fish Market");
  final TextEditingController _confirmUsernameController = TextEditingController(text: "Gaga's Fish Market");
  bool _isUsernameMatching = true;

  void _saveChanges() {
    // Here you would usually interact with the database or your state management solution
    String newUsername = _newUsernameController.text;
    String confirmUsername = _confirmUsernameController.text;
    if (newUsername == confirmUsername) {
      // Proceed to save the username
      print('Save the username: $newUsername');
      setState(() {
        _isUsernameMatching = true;
      });
    } else {
      // Handle the error
      print('The usernames do not match');
      setState(() {
        _isUsernameMatching = false;
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
          'Username',
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
                  'Username',
                  style: TextStyle(fontSize: 20, color: Color(0xFF4F4F4F)),
                ),
                SizedBox(height: 8),
                Text(
                  _newUsernameController.text,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF196DFF)),
                ),
                SizedBox(height: 64),
                TextFormField(
                  controller: _newUsernameController,
                  decoration: InputDecoration(
                    labelText: 'New Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isUsernameMatching ? "Usernames don't match" : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmUsernameController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorText: !_isUsernameMatching ? "Usernames don't match" : null,
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
                    onPressed: _saveChanges,
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
    _newUsernameController.dispose();
    _confirmUsernameController.dispose();
    super.dispose();
  }
}
