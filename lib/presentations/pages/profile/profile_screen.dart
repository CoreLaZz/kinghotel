import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/pages/product/product_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ProfilePage());
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showCVC = false;
  bool _showCardNumber = false;

  void _toggleCardNumber() {
    setState(() {
      _showCardNumber = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showCardNumber = false;
        });
      }
    });
  }

  void _toggleCVC() {
    setState(() {
      _showCVC = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showCVC = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              SizedBox(height: 24),
              _buildInfoItem('Phone number', '+855 17638382'),
              _buildInfoItem('Gender', 'Male'),
              _buildInfoItem('Nationality', 'Cambodia'),
              SizedBox(height: 24),
              _buildMemberCard(),
              SizedBox(height: 24),
              _buildCreditCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/profile.jpg'),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sokla Lor (CoreLaZz)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'soklalor@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Icon(Icons.edit, color: Colors.blue),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMemberCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('member card', style: TextStyle(color: Colors.grey)),
        ElevatedButton(
          onPressed: () {
          },
          child: Text('Add',style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1D2B4A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreditCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Credit card', style: TextStyle(color: Colors.grey)),
            Text('Master Card', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 8),
        _buildCreditCardImage(),
        SizedBox(height: 8),
        GestureDetector(
            onTap: _toggleCardNumber,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                _showCardNumber ? '7653 1234 5678 9012' : '**** **** **** ****',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('2024 / 12'),
            GestureDetector(
              onTap: _toggleCVC,
              child: Row(
                children: [
                  Text('CVC'),
                  SizedBox(width: 4),
                  Text(_showCVC ? '1 2 3' : '* * *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCreditCardImage() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text('debit', style: TextStyle(color: Colors.black)),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: _buildMastercardLogo(),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Row(
              children: [
                Icon(Icons.wifi, size: 20),
                SizedBox(width: 8),
                _buildChipIcon(),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMastercardLogo() {
    return Container(
      width: 40,
      height: 24,
      child: CustomPaint(
        painter: MastercardLogoPainter(),
      ),
    );
  }

  Widget _buildChipIcon() {
    return Container(
      width: 30,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            4,
            (_) => Container(
                  height: 2,
                  color: Colors.grey[400],
                  margin: EdgeInsets.symmetric(horizontal: 2),
                )),
      ),
    );
  }
}

class MastercardLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint redPaint = Paint()..color = Colors.red;
    final Paint orangePaint = Paint()..color = Colors.orange;

    canvas.drawCircle(
        Offset(size.width * 0.3, size.height / 2), size.height / 2, redPaint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height / 2),
        size.height / 2, orangePaint);

    final Paint blendPaint = Paint()
      ..color = Colors.deepOrange
      ..blendMode = BlendMode.multiply;

    canvas.drawCircle(
        Offset(size.width * 0.5, size.height / 2), size.height / 2, blendPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
