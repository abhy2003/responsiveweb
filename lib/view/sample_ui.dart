import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homescreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return buildMobileLayout();
          } else {
            return buildWebLayout(context);
          }
        },
      ),
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171C23),
        actions: [

          TextButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/register');
            },
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 28.sp),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF171C23),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: const Color(0xFF171C23)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('example@gmail.com',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  Text('Mon-Sat: 8:00 am-7.00 pm',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            _buildNavItem('Home', () {}),
            _buildNavItem('About', () {}),
            _buildNavItem('Courses', () {}),
            _buildNavItem('Blogs', () {}),
            _buildNavItem('Pages', () {}),
            _buildNavItem('Contact', () {}),
            Padding(
              padding: EdgeInsets.all(20.0.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94B2C),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                child: const Text('Get Quote',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bannerWidget(),
                    SizedBox(height: 20.h),
                    Container(
                      height: 800.h,
                      color: Colors.blue.withOpacity(0.2),
                      child: Center(
                        child: Text("Scrollable Content",
                            style: TextStyle(fontSize: 20.sp)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWebLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildNavigation(),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 500.h), // Minimum height
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      color: Colors.green.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Center(
              child:
              Text("More Web Content", style: TextStyle(fontSize: 20.sp))),
          // Example:
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 300.h,
            color: Colors.amber,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 300.h,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            color: const Color(0xFF171C23),
            child: Column(
              children: [
                SizedBox(
                  height: 60.0.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'example@gmail.com',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(width: 10.w),
                          const Text(
                            'Mon-Sat: 8:00 am-7.00 pm',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/login');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/register');
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook,
                                  size: 18, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.youtube_searched_for,
                                  size: 18, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.whatshot,
                                  size: 18, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.mail,
                                  size: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 40.0.h,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text("Home",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("About",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Courses",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Blogs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Pages",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Contact",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
          ),
          bannerWidget(),
        ],
      ),
    );
  }

  Widget bannerWidget() {
    List<CarouselItem> itemList = [
      CarouselItem(
        image: const AssetImage('assets/images/banner_image1.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: const AssetImage('assets/images/banner_image2.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: const AssetImage('assets/images/banner_image3.jpg'),
        onImageTap: (i) {},
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= 600;

        double carouselHeight =
        isMobile ? 300.h : 400.h;

        return SizedBox(
          height: carouselHeight,
          child: Stack(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: carouselHeight,
                child: CustomCarouselSlider(
                  items: itemList,
                  autoplay: true,
                  showText: false,
                  showSubBackground: false,
                  indicatorShape: BoxShape.circle,
                  selectedDotColor: const Color(0xFFE94B2C),
                  unselectedDotColor: Colors.grey,
                  height: carouselHeight,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  // Reduced padding

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME TO OUR FITNESS CENTER",
                        style: TextStyle(
                          fontSize: isMobile ? 14.sp : 20.sp,
                          // Smaller font size

                          fontWeight: FontWeight.bold,

                          color: Colors.white,

                          letterSpacing: 1.2,
                        ),
                      ),

                      SizedBox(height: 10.h), // Reduced spacing

                      Text(
                        "Stay healthy by exercising at the best gym center",
                        style: TextStyle(
                          fontSize: isMobile ? 12.sp : 16.sp,
                          // Smaller font size

                          color: Colors.white,

                          fontWeight: FontWeight.w100,
                        ),
                      ),

                      SizedBox(height: 20.h), // Reduced spacing

                      if (isMobile)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildButton(
                              title: 'Watch Video',

                              icon: Icons.play_circle_outline,

                              onPressed: () {},

                              isMobile: isMobile,

                              fontSize: isMobile ? 10.sp : 14.sp,
                              // Smaller font size

                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 10.w : 20.w,
                                // Reduced padding

                                vertical:
                                isMobile ? 8.h : 12.h, // Reduced padding
                              ),
                            ),

                            SizedBox(height: 10.h), // Reduced spacing

                            _buildButton(
                              title: 'Learn More',

                              onPressed: () {},

                              isOutlined: true,

                              isMobile: isMobile,

                              fontSize: isMobile ? 10.sp : 14.sp,
                              // Smaller font size

                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 10.w : 20.w,
                                // Reduced padding

                                vertical:
                                isMobile ? 8.h : 12.h, // Reduced padding
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildButton(
                                title: 'Watch Video',

                                icon: Icons.play_circle_outline,

                                onPressed: () {},

                                isMobile: isMobile,

                                fontSize: 14.sp,
                                // Smaller font size

                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, // Reduced padding

                                  vertical: 12.h, // Reduced padding
                                ),
                              ),
                            ),

                            SizedBox(width: 10.w), // Reduced spacing

                            Expanded(
                              child: _buildButton(
                                title: 'Learn More',

                                onPressed: () {},

                                isOutlined: true,

                                isMobile: isMobile,

                                fontSize: 14.sp,
                                // Smaller font size

                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, // Reduced padding

                                  vertical: 12.h, // Reduced padding
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton({
    required String title,
    IconData? icon,
    required VoidCallback onPressed,
    bool isOutlined = false,
    required bool isMobile,
    double? fontSize,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
        isOutlined ? Colors.transparent : const Color(0xFFE94B2C),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: isMobile ? 10.w : 20.w, // Reduced padding

              vertical: isMobile ? 8.h : 12.h, // Reduced padding
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: isOutlined
              ? const BorderSide(color: Colors.white, width: 2)
              : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: isMobile ? 14.sp : 16.sp, color: Colors.white),
            // Smaller icon

            SizedBox(width: 6.w),
            // Reduced spacing
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.white,

              fontSize: fontSize ?? (isMobile ? 10.sp : 14.sp),
              // Smaller font size

              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
      onTap: onTap,
    );
  }
}
