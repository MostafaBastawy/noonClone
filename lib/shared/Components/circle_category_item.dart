import 'package:flutter/material.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/models/category_model.dart';
import 'package:noon_clone/modules/product_screen.dart';
import 'package:noon_clone/shared/components.dart';

class CircleCategoryItem extends StatelessWidget {
  CategoryDataModel? categoryDataModel;

  CircleCategoryItem(this.categoryDataModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context: context,
            widget: ProductScreen(AppCubit.get(context).productDataModel));
      },
      child: Container(
        height: 152.0,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber[400],
              radius: 30.0,
              child: CircleAvatar(
                radius: 29.0,
                backgroundColor: Colors.white,
                backgroundImage:
                    NetworkImage('${categoryDataModel!.categoryImage}'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              categoryDataModel!.categoryName.toString(),
              style:
                  const TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
