import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/models/favorites_model.dart';

class FavoritesProductItem extends StatelessWidget {
  FavoriteDataModel? favoriteDataModel;
  //ProductDataModel? productDataModel;
  FavoritesProductItem(this.favoriteDataModel, {Key? key}) : super(key: key);

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
                      '${favoriteDataModel!.description}',
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
                          '${favoriteDataModel!.price}',
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
                    image: NetworkImage('${favoriteDataModel!.imageUrl}'),
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
                    AppCubit.get(context).addToCart(
                      description: favoriteDataModel!.description.toString(),
                      imageUrl: favoriteDataModel!.imageUrl.toString(),
                      name: favoriteDataModel!.name.toString(),
                      price: favoriteDataModel!.price.toString(),
                      productUid: '${favoriteDataModel!.pUid}',
                      pUid: favoriteDataModel!.pUid.toString(),
                    );
                    print('hiii');
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
                InkWell(
                  onTap: () {
                    print('hrrr');
                    AppCubit.get(context).removeFromFavorite(
                      userUid:
                          FirebaseAuth.instance.currentUser!.email.toString(),
                      pUid: favoriteDataModel!.pUid.toString(),
                    );
                  },
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
