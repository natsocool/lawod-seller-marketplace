import 'package:flutter/material.dart';
import 'package:lawod/fisherfolkLanding.dart';

class FisherfolkRegistration extends StatefulWidget {
  @override
  _FisherfolkRegistrationState createState() => _FisherfolkRegistrationState();
}

class _FisherfolkRegistrationState extends State<FisherfolkRegistration> {
  final _formKey = GlobalKey<FormState>();
  String? fishermanID;
  String? boatID;
  String storeName = '';
  String storeLocation = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you would typically make a request to your PHP backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF5B5B5B)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 4, 32, 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 16.0),
                Text(
                  'Fisherfolk Account',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0054E5),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Net a wider market for your catches!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fisherman ID (optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSaved: (value) => fishermanID = value,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Boat ID (optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSaved: (value) => boatID = value,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Store Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the store name';
                    }
                    return null;
                  },
                  onSaved: (value) => storeName = value!,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Store Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the store location';
                    }
                    return null;
                  },
                  onSaved: (value) => storeLocation = value!,
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Perform the submission logic, such as sending data to your backend
                      _submitForm(); // This will be your form submission logic
                      // After submission, navigate to the SellerProfilePage
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FisherfolkLanding()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0054E5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}