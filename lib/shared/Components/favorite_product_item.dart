import 'package:flutter/material.dart';

class FavoritesProductItem extends StatelessWidget {
  const FavoritesProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 155.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                width: 200.0,
                child: Column(
                  children: [
                    const Text(
                      'Product Description Product Description Product Description Product Description Product Description',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: const [
                        Text(
                          'EGP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text(
                          '111.00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100.0,
                width: 80.0,
                child: const Image(
                  image: NetworkImage(
                      'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-9/240669017_185430023562436_2896551028759384734_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=e3f864&_nc_ohc=mJs--nXjTI4AX-wY7i4&_nc_ht=scontent.fcai20-4.fna&oh=7cf7315511d45c6cc88935ba7cf949f6&oe=6196FFB3'),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.grey[500],
                      ),
                      Text(
                        'Move to cart',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.restore_from_trash_outlined,
                        color: Colors.grey[500],
                      ),
                      Text(
                        'Remove',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
