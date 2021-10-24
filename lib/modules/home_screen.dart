import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/shared/Components/circle_category_item.dart';
import 'package:noon_clone/shared/Components/product_item.dart';
import 'package:noon_clone/shared/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: carouselSliderImages,
                options: CarouselOptions(
                  height: 75.0,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180.0,
                  child: GridView.count(
                    physics: null,
                    crossAxisCount: 2,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(cubit.categories.length,
                        (index) => CircleCategoryItem(cubit.categories[index])),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Mobiles',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryMobiles[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryMobiles.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Electronics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryElectronics[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryElectronics.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'TVs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryTVs[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryTVs.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'LapTops',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryLaptops[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryLaptops.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Appliances',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryAppliances[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryAppliances.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Grocery',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryGrocery[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryGrocery.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Women\'s Fashion',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryWomenFashion[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryWomenFashion.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Men\'s Fashion',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryMenFashion[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryMenFashion.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Beauty',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryBeauty[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryBeauty.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Home & Kitchen',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryHomeKitchen[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryHomeKitchen.length,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Baby',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Container(
                  height: 281.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(cubit.categoryBaby[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    itemCount: cubit.categoryBaby.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
