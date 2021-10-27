import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/models/cart_model.dart';

class CartProductItem extends StatelessWidget {
  CartDataModel? cartDataModel;

  CartProductItem(this.cartDataModel, {Key? key}) : super(key: key);

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, Object? state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 175.0,
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
                          '${cartDataModel!.description}',
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
                              '${cartDataModel!.price}',
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
                        image: NetworkImage('${cartDataModel!.imageUrl}'),
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
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber[400],
                          child: IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateUserCartCounter(
                                productUid: cartDataModel!.pUid.toString(),
                                counter: cartDataModel!.counter! - 1,
                              );

                              // counter--;
                              // if (counter == 1) {
                              //   counter = 1;
                              // } else {
                              //   AppCubit.get(context).total =
                              //       AppCubit.get(context).total -
                              //           cartDataModel!.price!;
                              //   AppCubit.get(context).updateUserCartTotal();
                              //   AppCubit.get(context).updateUserCartCounter(
                              //     counter: counter,
                              //     productUid: cartDataModel!.pUid!,
                              //   );
                              // }
                            },
                            icon: const Icon(
                              Icons.arrow_circle_down,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '${cartDataModel!.counter}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.amber[400],
                          child: IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateUserCartCounter(
                                productUid: cartDataModel!.pUid.toString(),
                                counter: cartDataModel!.counter! + 1,
                              );
                              // counter++;
                              // AppCubit.get(context).total =
                              //     AppCubit.get(context).total +
                              //         cartDataModel!.price!;
                              // AppCubit.get(context).updateUserCartTotal();
                              // AppCubit.get(context).updateUserCartCounter(
                              //   counter: counter,
                              //   productUid: cartDataModel!.pUid!,
                              // );
                            },
                            icon: const Icon(
                              Icons.arrow_circle_up_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).removeFromCart(
                          userEmail: FirebaseAuth.instance.currentUser!.email
                              .toString(),
                          pUid: cartDataModel!.pUid.toString(),
                        );
                        // AppCubit.get(context).total =
                        //     AppCubit.get(context).total -
                        //         (counter * cartDataModel!.price!);
                        // AppCubit.get(context).updateUserCartTotal();
                        // AppCubit.get(context).updateUserCartCounter(
                        //   counter: counter,
                        //   productUid: cartDataModel!.pUid!,
                        // );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.restore_from_trash_outlined,
                            color: Colors.red,
                          ),
                          Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.red,
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
      },
    );
  }
}
