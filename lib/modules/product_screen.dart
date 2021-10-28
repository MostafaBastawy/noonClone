import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/models/category_model.dart';
import 'package:noon_clone/shared/Components/clicked_category_item.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen(this.categoryDataModel, {Key? key}) : super(key: key);
  //ProductDataModel? productDataModel;
  CategoryDataModel? categoryDataModel;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    cubit.getCategoryProducts(category: categoryDataModel!.categoryName!);

    print(categoryDataModel!.categoryName!);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Image(
              image: AssetImage('assets/images/noon_logo.png'),
              width: 100.0,
              height: 100.0,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ClickedCategoryItem(cubit.categoryProducts[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0);
              },
              itemCount: cubit.categoryProducts.length,
            ),
          ),
        );
      },
    );
  }
}
