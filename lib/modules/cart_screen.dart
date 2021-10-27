import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/shared/Components/cart_product_item.dart';
import 'package:noon_clone/shared/components.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getCartItems();

    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      defaultButton(
                        function: () {},
                        text: 'Confirm',
                        background: Colors.blueAccent[700]!,
                        width: MediaQuery.of(context).size.width * 0.58,
                      ),
                      const Spacer(),
                      defaultButton(
                        function: () {},
                        text:
                            'EGP ${AppCubit.get(context).userDataModel!.cartTotal}',
                        background: Colors.blueAccent[700]!,
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
