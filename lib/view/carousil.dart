import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class BannerImages extends StatelessWidget {
  const BannerImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CarouselItem> itemList = [
      CarouselItem(
        image: AssetImage('assets/images/banner_image1.jpg'), // Use AssetImage for ImageProvider
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: AssetImage('assets/images/banner_image2.jpg'), // Use AssetImage for ImageProvider
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: AssetImage('assets/images/banner_image3.jpg'), // Use AssetImage for ImageProvider
        onImageTap: (i) {},
      ),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width, // Full screen width
      height: MediaQuery.of(context).size.height * 0.4, // Height of the carousel (adjustable)
      child: CustomCarouselSlider(
        items: itemList,
        autoplay: true,
        showText: false,
        showSubBackground: false,
        indicatorShape: BoxShape.circle,
        selectedDotColor: Colors.red,
        unselectedDotColor: Colors.grey,
      ),
    );
  }
}
