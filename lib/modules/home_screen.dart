import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: <Widget>[
            Image.asset('assets/images/carousel_slider/carousel_image1.jpg'),
            Image.asset('assets/images/carousel_slider/carousel_image2.jpg'),
            Image.asset('assets/images/carousel_slider/carousel_image3.jpg'),
          ],
          options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1.0,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
