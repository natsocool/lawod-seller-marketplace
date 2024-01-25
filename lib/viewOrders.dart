import 'package:flutter/material.dart';
import 'package:lawod/orderContent.dart';
import 'fisherfolkLanding.dart';

class ViewOrders extends StatefulWidget {
  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  int _currentIndex = 0;

  void _handleNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
      // Handle navigation logic here
    });
  }

  List<Map<String, dynamic>> orders = [
    {
      'orderID': 'Order - 01',
      'orderQuantity': '3+ kilos',
      'total': '₱ 75.00',
      'productImage': 'https://drive.google.com/uc?export=view&id=1g7L3TM13_C05HKLNKXDbSkitobMc_-ov',
    },
    {
      'orderID': 'Order - 02',
      'orderQuantity': '3 kilos',
      'total': '₱ 600.00',
      'productImage': 'https://drive.google.com/uc?export=view&id=1xEDEFW_GDtPycbWw8UiUEnBfDL3q_vOH',
    },
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            color: Color(0xFF196DFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4F4F4F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderContent()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        order['productImage'] ?? 'https://via.placeholder.com/150',
                        width: 125,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order['orderID'] ?? 'Order ID',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Quantity: ${order['orderQuantity'] ?? 'N/A'}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4F4F4F),
                              ),
                            ),
                            Text(
                              'Total: ${order['total'] ?? 'N/A'}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF196DFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // TODO: Handle delete order
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Button color
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(1), // Padding inside the container for the icon
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomCurvedNavigationBar(
        index: _currentIndex,
        onNavigationTap: _handleNavigationTap,
      ),
    );
  }
}