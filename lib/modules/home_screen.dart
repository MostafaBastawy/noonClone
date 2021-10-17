import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            NetworkImage(
                'https://student.valuxapps.com/storage/uploads/banners/16283378549Vinn.banner foods@2x.png'),
            NetworkImage(
                'https://student.valuxapps.com/storage/uploads/banners/16283378549Vinn.banner foods@2x.png'),
          ]
              .map(
                (e) => Image(
                  image: NetworkImage(e.toString()),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
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
        Image(
            image: NetworkImage(
                'https://student.valuxapps.com/storage/uploads/banners/16283378549Vinn.banner foods@2x.png')),
      ],
    );
  }
}
