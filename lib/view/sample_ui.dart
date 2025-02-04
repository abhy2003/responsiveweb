import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return buildMobileLayout();
          } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1024) {
            return buildTabletLayout();
          } else {
            return buildDesktopLayout();
          }
        },
      ),
    );
  }

  // Mobile Layout
  Widget buildMobileLayout() {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF171C23),
            title: Image.asset(
              'assets/images/logo.png', // Replace with your logo
              height: 40.h, // Adjust logo size responsively
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/fitness_background.jpg', // Background image for mobile
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeroSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WELCOME TO OUR FITNESS CENTER",
          style: TextStyle(
            fontSize: 28.sp, // Use ScreenUtil for font size
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8.h),  // Use ScreenUtil for spacing
        Text(
          "Stay healthy by exercising at the best gym center",
          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontFamily: 'Poppins'),
        ),
      ],
    );
  }

  // Tablet Layout
  Widget buildTabletLayout() {
    return SafeArea(
      child: Column(
        children: [
          _buildNavigation(),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/fitness_background.jpg', // Background image for tablet
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeroSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Desktop Layout
  Widget buildDesktopLayout() {
    return SafeArea(
      child: Column(
        children: [
          _buildNavigation(),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/fitness_background.jpg', // Background image for desktop
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeroSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Combined Navbar Widget
  Widget _buildNavigation() {
    return Container(
      color: const Color(0xFF171C23),
      child: Column(
        children: [
          Container( // Top Bar
            height: 40.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'example@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const VerticalDivider(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Mon-Sat: 8:00 am-7.00 pm',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, size: 18, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.youtube_searched_for, size: 18, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.whatshot, size: 18, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mail, size: 18, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container( // Bottom Bar
            height: 80.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png', // Your logo path
                  height: 40.0,
                ),
                Wrap(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Home", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("About", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Courses", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Blogs", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Pages", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Contact", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE94B2C),
                      ),
                      child: const Text(
                        'Get Quote',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
