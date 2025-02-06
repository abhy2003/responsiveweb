import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerImages extends StatelessWidget {
  const BannerImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CarouselItem> itemList = [
      CarouselItem(
        image: AssetImage('assets/images/banner_image1.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: AssetImage('assets/images/banner_image2.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: AssetImage('assets/images/banner_image3.jpg'),
        onImageTap: (i) {},
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= 600;
        double carouselHeight = isMobile ? 400.h : 600.h;

        return Stack(
          children: [
            // Carousel
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

            // Overlay gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME TO OUR FITNESS CENTER",
                      style: TextStyle(
                        fontSize: isMobile ? 24.sp : 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Stay healthy by exercising at the best gym center",
                      style: TextStyle(
                        fontSize: isMobile ? 16.sp : 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Wrap Column in a SingleChildScrollView to handle vertical overflow
                    if (isMobile)
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildButton(
                              title: 'Watch Video',
                              icon: Icons.play_circle_outline,
                              onPressed: () {},
                              isMobile: isMobile,
                            ),
                            SizedBox(height: 15.h),
                            _buildButton(
                              title: 'Learn More',
                              onPressed: () {},
                              isOutlined: true,
                              isMobile: isMobile,
                            ),
                          ],
                        ),
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
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: _buildButton(
                              title: 'Learn More',
                              onPressed: () {},
                              isOutlined: true,
                              isMobile: isMobile,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
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
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.transparent : const Color(0xFFE94B2C),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.w : 40.w,
          vertical: isMobile ? 15.h : 20.h,
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
            Icon(icon, size: isMobile ? 20.sp : 28.sp, color: Colors.white),
            SizedBox(width: 8.w),
          ],
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 14.sp : 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
