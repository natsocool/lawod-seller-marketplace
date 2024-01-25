import 'package:flutter/material.dart';
import 'userName.dart';
import 'userFullName.dart';
import 'userEmail.dart';
import 'userPassword.dart';
import 'userPhone.dart';


class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String userName = "Gaga's Fish Market";
  String fullName = "Adelfa Baclayon";
  String email = 'adelfa@gmail.com';
  String phoneNumber = '09876543210';
  String password = 'idontknow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 305,
            child: Text(
              'Information',
              style: TextStyle(
                color: Color(0xFF196DFF),
                fontSize: 31,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4F4F4F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: ShapeDecoration(
                color: Color(0x701D1B1B),
                shape: CircleBorder(),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://drive.google.com/uc?export=view&id=1Dc-e2GPOpqWgumRNt8kLVp6b_ztKI2yw',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 43),
            Container(
              width: 332.67,
              height: 347,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Username', userName, UserName()),
                  const SizedBox(height: 25),
                  _buildInfoRow('Full Name', fullName, UserFullName()),
                  const SizedBox(height: 25),
                  _buildInfoRow('Email', email, UserEmail()),
                  const SizedBox(height: 25),
                  _buildInfoRow('Phone Number', phoneNumber, UserPhoneNumber()),
                  const SizedBox(height: 25),
                  _buildInfoRow('Password', '********', UserPassword()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        width: 332.67,
        height: 37,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: 107.24,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 17,
              child: SizedBox(
                width: 198,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Color(0xFF196DFF),
                    fontSize: 20,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 283,
              top: 10,
              child: SizedBox(
                width: 49.67,
                child: Text(
                  'Change',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 14,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
