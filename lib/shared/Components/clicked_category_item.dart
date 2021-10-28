import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/models/product_model.dart';

class ClickedCategoryItem extends StatelessWidget {
  ProductDataModel? productDataModel;
  ClickedCategoryItem(this.productDataModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      '${productDataModel!.description}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'EGP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
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
              ),
              Container(
                height: 100.0,
                width: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage('${productDataModel!.imageUrl}'),
                    fit: BoxFit.fill,
                  ),
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
                  onTap: () {
                    AppCubit.get(context).addToFavorites(
                      description: productDataModel!.description.toString(),
                      imageUrl: productDataModel!.imageUrl.toString(),
                      name: productDataModel!.name.toString(),
                      price: productDataModel!.price!,
                      productUid: '${productDataModel!.pUid}',
                      pUid: productDataModel!.pUid.toString(),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.grey[500],
                      ),
                      Text(
                        'Move to favorites',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppCubit.get(context).addToCart(
                      description: productDataModel!.description.toString(),
                      imageUrl: productDataModel!.imageUrl.toString(),
                      name: productDataModel!.name.toString(),
                      price: productDataModel!.price!,
                      productUid: '${productDataModel!.pUid}',
                      pUid: productDataModel!.pUid.toString(),
                    );
                    AppCubit.get(context).removeFromFavorite(
                      userEmail:
                          FirebaseAuth.instance.currentUser!.email.toString(),
                      pUid: productDataModel!.pUid.toString(),
                    );
                    AppCubit.get(context).updateUserCartTotal(
                      total: (AppCubit.get(context).userDataModel!.cartTotal! +
                          productDataModel!.price!),
                    );
                  },
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
