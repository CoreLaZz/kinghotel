import 'dart:js';
import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildPopularItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Outline color
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200), // Outline color when enabled
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Outline color when focused
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white, // Color inside the text field
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('All Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildPopularItemCard(context);
          },
        ),
      ],
    );
  }

  Widget _buildPopularItemCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to HomeScreen when a card is tapped
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        // );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/Banner.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Resort',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Istanbul, Turkey',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    '\$24.00/night',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home Screen'),
        // ),
        body: ProductPage());
  }
}
