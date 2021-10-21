import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
                padding: const EdgeInsets.all(0),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                padding: const EdgeInsets.all(0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
