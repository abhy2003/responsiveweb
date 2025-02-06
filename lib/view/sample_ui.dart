import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'carousil.dart';

class ResponsiveNavBar extends StatelessWidget {
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
            return buildWebLayout();
          }
        },
      ),
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171C23),
        title: Image.asset(
          'assets/images/logo.png',
          height: 40.0.h,
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white, size: 28.sp),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF171C23),
        child: Container(
          color: const Color(0xFF171C23),
          child: Column(
            children: [
              Container(
                height: 80.0.h,
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'example@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Mon-Sat: 8:00 am-7.00 pm',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: [
                    _buildNavItem('Home', () {}),
                    _buildNavItem('About', () {}),
                    _buildNavItem('Courses', () {}),
                    _buildNavItem('Blogs', () {}),
                    _buildNavItem('Pages', () {}),
                    _buildNavItem('Contact', () {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.w),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94B2C),
                    minimumSize: Size(double.infinity, 50.h),
                  ),
                  child: const Text(
                    'Get Quote',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            BannerImages(),
          ],
        ),
      ),
    );
  }

  Widget buildWebLayout() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: _buildNavigation(),
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
          BannerImages(),
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