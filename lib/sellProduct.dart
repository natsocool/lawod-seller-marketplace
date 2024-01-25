import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellProduct extends StatefulWidget {
  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String productName = '';
  int productPrice = 0;
  String category = '';
  int productStock = 0;
  XFile? image;

  // Dummy categories
  final List<String> categories = ['Fish', 'Shellfish', 'Equipment', 'Gears'];

  Future<void> pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      image = selectedImage;
    });
  }

  void submitSellForm() {
    if (_formKey.currentState!.validate()) {
      // Implement the product addition logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Start Selling', style: TextStyle(color: Color(0xFF196DFF), fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Color(0xFF4F4F4F)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Color(0xFF4F4F4F)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: image != null
                        ? Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                        : Center(
                      child: Text(
                        'Tap Button below to Upload Image',
                        style: TextStyle(color: Color(0xFF4F4F4F)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 32,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFE0ECF8),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Wrap(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Pick from Gallery'),
                                    onTap: () {
                                      pickImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_camera),
                                    title: Text('Take a Photo'),
                                    onTap: () {
                                      pickImage(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/images/uploadPic.png',
                        width: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name of the Product',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onChanged: (value) => productName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name of the product';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price (per kilo)',
                    prefixText: '₱ ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onChanged: (value) => productPrice = int.tryParse(value) ?? 0,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price per kilo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  value: category.isEmpty ? null : category,
                  onChanged: (String? newValue) {
                    setState(() {
                      category = newValue!;
                    });
                  },
                  items: categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) => value == null ? 'Please select a category' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onChanged: (value) => productStock = int.tryParse(value) ?? 0,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the stock information';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  child: Text(
                    'Sell Product',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: submitSellForm,
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
