import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kinghotel/presentations/pages/home/home_screen.dart';
import 'package:kinghotel/presentations/pages/product/product_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPromoBanner(),
              _buildReport(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      child: ClipRRect(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/cart1.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Resort',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wood Resort',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$196',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1D2B4A),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          child: const Text(
                            'view',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildReport() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        SizedBox(height: 32.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your promo code',
            prefixIcon: Icon(Icons.airplane_ticket_rounded),
            suffixIcon: Icon(Icons.arrow_forward),
          ),
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item Cost',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\$169.00',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\$2.00',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\$198.00',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "View More",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1D2B4A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBarPage(
                          selectedIndex: 1, title: '', child: ProductScreen())),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booking View'),
        ),
        body: CartPage());
  }
}
