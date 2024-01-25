import 'package:flutter/material.dart';
import 'package:lawod/userAccount.dart';
import 'sellProduct.dart';
import 'viewProducts.dart';
import 'viewOrders.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FisherfolkLanding extends StatefulWidget {
  @override
  _FisherfolkLandingState createState() => _FisherfolkLandingState();
}

class _FisherfolkLandingState extends State<FisherfolkLanding> {
  String userName = 'Gaga’s Fish Market'; // Example username, replace with your dynamic
  int _currentIndex = 0;

  void _handleNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
      // Handle navigation logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = 65.0; // Avatar radius

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marketplace',
          style: TextStyle(
            color: Color(0xFF196DFF), // Blue color for the title
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4F4F4F)), // Dark grey color for the back icon
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              SizedBox(height: avatarRadius + 5), // Space for the avatar
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserAccount()),
                  ); // Replace with your route
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF196DFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.fromLTRB(20, avatarRadius, 20, 20),
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'El Salvador City',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '10',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFFAB19)),
                              ),
                              Text(
                                'Products',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '4.9',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFFAB19)),
                              ),
                              Text(
                                'Rating',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFAB19), Color(0xFFF0C735)], // Linear gradient color
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(32),
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your total sales',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '₱ 12,500', // Replace with your dynamic data
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SellProduct()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFFFFAD1B), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        elevation: 4, // Shadow elevation
                        shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
                      ),
                      child: Text('Sell Now', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCustomButton(
                    context,
                    'https://drive.google.com/uc?export=view&id=1km0h_2brG3UOdFv1X9ljVFdx3wCOcR1n',
                    'Products',
                  ),
                  _buildCustomButton(
                    context,
                    'https://drive.google.com/uc?export=view&id=1YzyBom4rKEk3E8KAVldxWmuaRrO731Jc',
                    'Orders',
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 6.5, // Adjust this value as needed
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.transparent, // To match the background if there's any gap
              child: CircleAvatar(
                radius: avatarRadius, // Actual avatar radius
                backgroundImage: NetworkImage(
                  'https://drive.google.com/uc?export=view&id=1Dc-e2GPOpqWgumRNt8kLVp6b_ztKI2yw', // Replace with your image URL
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomCurvedNavigationBar(
        index: _currentIndex,
        onNavigationTap: _handleNavigationTap,
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String imageUrl, String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (label == 'Products') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ViewProducts(),
            ));
          }
          if (label == 'Orders') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ViewOrders(),
            ));
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(48, 16, 48, 16),
              child: Image.network(imageUrl, width: 55), // Network image
            ),
            Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), // Text label
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CustomCurvedNavigationBar extends StatelessWidget {
  final int index;
  final Function(int) onNavigationTap;

  CustomCurvedNavigationBar({
    required this.index,
    required this.onNavigationTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      height: 60.0,
      items: <Widget>[
        Image.asset('assets/images/communitybtn.png',
            width: 30, height: 30, color: Colors.white),
        Image.asset('assets/images/marketplacebtn.png',
            width: 30, height: 30, color: Colors.white),
        Image.asset('assets/images/accountbtn.png',
            width: 30, height: 30, color: Colors.white),
      ],
      color: Color(0xFFE0ECF8),
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Color(0xFF196DFF),
      animationDuration: Duration(milliseconds: 300),
      onTap: onNavigationTap,
    );
  }
}