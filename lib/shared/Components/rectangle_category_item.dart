import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RectangleCategoryItem extends StatelessWidget {
  const RectangleCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[100]!,
                width: 15.0,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/I/51wJNDMnmnL._AC_SY741_.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Mobiles',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
