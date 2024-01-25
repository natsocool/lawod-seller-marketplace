import 'package:flutter/material.dart';
import 'package:lawod/fisherfolkRegistration.dart';
import 'package:lawod/userInfo.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String userName = 'Gaga’s Fish Market'; // Example username, replace with your dynamic data

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = 65.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Marketplace',
          style: TextStyle(
            color: Color(0xFF196DFF),
            fontSize: 31,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4F4F4F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(height: avatarRadius * 2),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(
                      children: [
                        Text(
                          'ADELFA BACLAYON',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF196DFF),
                            fontSize: 25,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 20,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 32),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
                            _buildCard(context, 'Orders', 'assets/images/orders.png'),
                            _buildCard(context, 'Account Information', 'assets/images/accountInfo.png'),
                            _buildCard(context, 'Policy', 'assets/images/policy.png'),
                            _buildCard(context, 'Help', 'assets/images/help.png'),
                          ],
                        ),
                        SizedBox(height: 20), // Additional space at the bottom
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12, // Adjusted for the screen size
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: avatarRadius - 5, // Small white border
                  backgroundImage: NetworkImage(
                    'https://drive.google.com/uc?export=view&id=1Dc-e2GPOpqWgumRNt8kLVp6b_ztKI2yw',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserInfo(),
        ));
      },
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80, height: 80),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
