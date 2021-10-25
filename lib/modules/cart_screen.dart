import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/shared/Components/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getCartItems();

    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CartProductItem(AppCubit.get(context).cart[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10.0);
                  },
                  itemCount: AppCubit.get(context).cart.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
