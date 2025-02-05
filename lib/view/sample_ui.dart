import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleweb/view/carousil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class HomeScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil without 'orientation' parameter
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

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

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 350.h), // Adjust the height as needed to move the text down
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "WELCOME TO OUR FITNESS CENTER",
            style: GoogleFonts.poppins(
              fontSize: 10.sp, // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Stay healthy by exercising at the best gym center",
          style: GoogleFonts.poppins(
            fontSize: 5.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15.h),
        // Row to display buttons horizontally
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE94B2C),
              ),
              child: const Text(
                'Watch Video',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10.w), // Add space between the buttons
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE94B2C),
              ),
              child: const Text(
                'Learn More',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Mobile Layout
  Widget buildMobileLayout() {
    return SafeArea(
      child: SingleChildScrollView( // Wrapping everything in SingleChildScrollView
        controller: _scrollController,  // Assigning the ScrollController
        child: Scrollbar( // Add Scrollbar here
          controller: _scrollController,  // Assign the same controller
          thumbVisibility: true, // Make scrollbar always visible
          child: Column(
            children: [
              AppBar(
                backgroundColor: const Color(0xFF171C23),
                title: Image.asset(
                  'assets/images/logo.png',
                  height: 40.h, // Responsive height
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
              Stack(
                children: [
                  BannerImages(),
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
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w), // Responsive padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeroSection(),
                        SizedBox(height: 20.h), // Responsive spacing
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tablet Layout
  Widget buildTabletLayout() {
    return SafeArea(
      child: SingleChildScrollView( // Wrapping everything in SingleChildScrollView
        child: Scrollbar( // Add Scrollbar here
          thumbVisibility: true, // Make scrollbar always visible
          child: Column(
            children: [
              _buildNavigation(),
              Stack(
                children: [
                  BannerImages(),
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
                      child: Padding(
                        padding: EdgeInsets.all(16.w), // Responsive padding
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
            ],
          ),
        ),
      ),
    );
  }

  // Desktop Layout
  Widget buildDesktopLayout() {
    return SafeArea(
      child: SingleChildScrollView( // Wrapping everything in SingleChildScrollView
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;

            // Adjust padding for larger screens
            double padding = width > 1200 ? 32.w : 16.w;

            return Column(
              children: [
                _buildNavigation(),
                Stack(
                  children: [
                    Positioned.fill(child: BannerImages()), // Full-screen banner
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
                        child: Padding(
                          padding: EdgeInsets.all(padding), // Responsive padding
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHeroSection(),
                              // Additional content for larger screens
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
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
            height: 40.0.h, // Responsive height
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                      height: 20.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
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
            height: 80.0.h, // Responsive height
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png', // Your logo path
                  height: 40.0.h,
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
class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/fitness_background.jpg', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay to make text readable
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(16.w), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h), // To adjust for the top section
                Text(
                  "About Fitness Center",
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h), // Space between title and content
                Text(
                  "We are the best at fulfilling your potential and achieving your goals.",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h), // Space between subtitle and description
                Text(
                  "Lorem ipsum dolor, sit amet consectetur adipisicing elit. In impedit accusantium autem quaerat natus nesciunt veritatis fugiat dolor eaque fuga.",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
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
