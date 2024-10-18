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
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey), // Outline color
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade200), // Outline color when enabled
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.grey), // Outline color when focused
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white, // Color inside the text field
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
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
          const Text(
            'Enjoy 50% Off',
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'up to \$399',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF1D2B4A), // Set the background color here
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5), // Optional: Round the edges
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 24.5), // Optional: Adjust padding
            ),
            child: const Text(
              'Continue',
              style: const TextStyle(color: Colors.white),
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
    return const Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        children: [
          const Icon(Icons.location_on, color: Colors.blue),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Check our Address'),
              const Text('Kompot, 109 187 198, Cambodia',
                  style: const TextStyle(color: Colors.grey)),
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
              const Text('Popular Items',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                child: const Text('See all'),
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
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            margin: const EdgeInsets.all(8),
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
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: const Text(
                    '\$24.00/night',
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
