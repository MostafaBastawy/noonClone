import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noon_clone/shared/Components/rectangle_category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              physics: null,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children:
                  List.generate(11, (index) => const RectangleCategoryItem()),
            ),
          ),
        ],
      ),
    );
  }
}
