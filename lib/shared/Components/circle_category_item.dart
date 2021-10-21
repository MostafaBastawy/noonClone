import 'package:flutter/material.dart';

class CircleCategoryItem extends StatelessWidget {
  const CircleCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.0,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber[400],
            radius: 30.0,
            child: const CircleAvatar(
              radius: 29.0,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://dream2000.com/pub/media/catalog/product/cache/f0c876fc5fd423dc009b2416a0e65966/2/4/241.jpg'),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            'MOBILES',
            style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
