import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:kinghotel/config/service.dart';
import 'package:kinghotel/data/models/slide_item_model.dart';
import 'package:kinghotel/presentations/pages/home/home_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class OnboardingSlider extends StatefulWidget {
  @override
  _OnboardingSliderState createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  List<SliderItem> _sliderItems = [];

  @override
  void initState() {
    super.initState();
    _fetchSlides();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _fetchSlides() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/slides'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        setState(() {
          _sliderItems =
              jsonList.map((json) => SliderItem.fromJson(json)).toList();
        });
      } else {
        print('Failed to load slides with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching slides: $e');
    }
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _sliderItems.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
            Expanded(
              child: _sliderItems.isEmpty
                  ? Center(
                      child: CircularProgressIndicator()) // Loading indicator
                  : PageView.builder(
                      controller: _pageController,
                      itemCount: _sliderItems.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return SliderPage(item: _sliderItems[index]);
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Get Start",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => BottomNavBarPage(
                          selectedIndex: 0,
                          title: '',
                          child: HomeScreen(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D2B4A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _sliderItems.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 50 : 25,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF1D2B4A) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final SliderItem item;

  SliderPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore more",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            item.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            item.description,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
              height: 600,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
