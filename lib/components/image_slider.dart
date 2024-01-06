import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tese_journey/components/app_images.dart';

class Image_slider extends StatefulWidget {
  const Image_slider({super.key});

  @override
  State<Image_slider> createState() => _Image_sliderState();
}

class _Image_sliderState extends State<Image_slider> {
  final List<String> ImagesList = [
    AppImages.one,
    AppImages.two,
    AppImages.three,
    AppImages.image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              viewportFraction: 1, //full screen

              enableInfiniteScroll: false,

              reverse: true,
              autoPlayInterval: Duration(seconds: 2)),
          itemCount: ImagesList.length,
          itemBuilder: (context, index, realIndex) {
            final assetsImage = ImagesList[index];

            return buildImages(assetsImage, index);
          },
        ),
      ),
    );
  }

  Widget buildImages(String assetsImage, int index) => Container(
        // margin: EdgeInsets.symmetric(horizontal: 10), //space between images
        color: Colors.grey,
        child: Image.asset(
          assetsImage,
          fit: BoxFit.cover,
        ),
      );
}
