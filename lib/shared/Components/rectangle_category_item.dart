import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noon_clone/models/category_model.dart';
import 'package:noon_clone/modules/product_screen.dart';
import 'package:noon_clone/shared/components.dart';

class RectangleCategoryItem extends StatelessWidget {
  CategoryDataModel? categoryDataModel;

  RectangleCategoryItem(this.categoryDataModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          navigateTo(
              context: context, widget: ProductScreen(categoryDataModel));
        },
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
                  image: DecorationImage(
                    image: NetworkImage('${categoryDataModel!.categoryImage}'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              categoryDataModel!.categoryName!.toString().toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
