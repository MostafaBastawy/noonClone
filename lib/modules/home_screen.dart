import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:noon_clone/shared/components.dart';
import 'package:noon_clone/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
              height: 152.0,
              child: GridView.count(
                physics: null,
                crossAxisCount: 2,
                scrollDirection: Axis.horizontal,
                children: List.generate(50, (index) => buildCategoryItem()),
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
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
                  return buildProductItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // buildCategoryItem in Circle Avatar view
  Widget buildCategoryItem() => Container(
        height: 152.0,
        child: Column(
          children: const [
            CircleAvatar(
              backgroundColor: defaultColor,
              radius: 30.0,
              child: CircleAvatar(
                radius: 29.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://dream2000.com/pub/media/catalog/product/cache/f0c876fc5fd423dc009b2416a0e65966/2/4/241.jpg'),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'MOBILES',
              style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget buildProductItem() => Container(
        padding: const EdgeInsets.all(10.0),
        height: 281.0,
        width: 140.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [
            Container(
              height: 140.0,
              width: 120.0,
              child: const Image(
                image: NetworkImage(
                    'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-9/240669017_185430023562436_2896551028759384734_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=e3f864&_nc_ohc=mJs--nXjTI4AX-wY7i4&_nc_ht=scontent.fcai20-4.fna&oh=7cf7315511d45c6cc88935ba7cf949f6&oe=6196FFB3'),
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'Product Description Product Description Product Description Product Description Product Description',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10.0),
            ),
            Row(
              children: const [
                Text(
                  'EGP',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  '111.00',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  padding: EdgeInsets.all(0),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
          ],
        ),
      );
}
