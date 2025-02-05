import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class BannerImages extends StatelessWidget {
  const BannerImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CarouselItem> itemList = [
      CarouselItem(
        image: const AssetImage('assets/images/fitness_background.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: const AssetImage('assets/images/fitness_background.jpg'),
        onImageTap: (i) {},
      ),
      CarouselItem(
        image: const AssetImage('assets/images/fitness_background.jpg'),
        onImageTap: (i) {},
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Wrap the CustomCarouselSlider with a SizedBox or Container
            SizedBox(
              height: 250.0,  // Set a fixed height for the carousel
              width: MediaQuery.of(context).size.width,  // Full screen width
              child: CustomCarouselSlider(
                items: itemList,
                autoplay: true,
                showText: false,
                showSubBackground: false,
                indicatorShape: BoxShape.circle,
                selectedDotColor: Colors.red,
                unselectedDotColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
