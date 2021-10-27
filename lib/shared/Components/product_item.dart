import 'package:flutter/material.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/models/product_model.dart';
import 'package:noon_clone/models/user_model.dart';

class ProductItem extends StatelessWidget {
  ProductDataModel? productDataModel;
  UserDataModel? userDataModel;
  int? index;

  ProductItem(this.productDataModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 281.0,
      width: 140.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 140.0,
                width: 120.0,
                child: Image(
                  image: NetworkImage('${productDataModel!.imageUrl}'),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '${productDataModel!.description}',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10.0),
              ),
              Row(
                children: [
                  const Text(
                    'EGP',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    '${productDataModel!.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).addToFavorites(
                    description: productDataModel!.description.toString(),
                    imageUrl: productDataModel!.imageUrl.toString(),
                    name: productDataModel!.name.toString(),
                    price: productDataModel!.price!,
                    productUid: '${productDataModel!.pUid}',
                    pUid: productDataModel!.pUid.toString(),
                  );
                },
                icon: const Icon(Icons.favorite),
                padding: const EdgeInsets.all(0),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).addToCart(
                    description: productDataModel!.description.toString(),
                    imageUrl: productDataModel!.imageUrl.toString(),
                    name: productDataModel!.name.toString(),
                    price: productDataModel!.price!,
                    productUid: '${productDataModel!.pUid}',
                    pUid: productDataModel!.pUid.toString(),
                  );
                  AppCubit.get(context).updateUserCartTotal(
                    total: (AppCubit.get(context).userDataModel!.cartTotal! +
                        productDataModel!.price!),
                  );
                },
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
