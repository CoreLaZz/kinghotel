import 'dart:js';
import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/pages/product/product_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildPromoBanner(),
              _buildAddressSection(),
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

  Widget _buildPromoBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('images/Banner.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enjoy 50% Off',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'up to \$399',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF1D2B4A), // Set the background color here
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5), // Optional: Round the edges
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 24.5), // Optional: Adjust padding
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigate to HomeScreen when Continue is pressed
              // Navigator.push(
              //   context as BuildContext,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.blue),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Check our Address'),
              Text('Kompot, 109 187 198, Cambodia',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
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
              Text('Popular Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                child: Text('See all'),
                onPressed: () {
                  // Navigate to HomeScreen when See all is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavBarPage(
                            selectedIndex: 1,
                            title: '',
                            child: ProductScreen())),
                  );
                },
              ),
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
          itemCount: 4,
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home Screen'),
        // ),
        body: HomePage());
  }
}
