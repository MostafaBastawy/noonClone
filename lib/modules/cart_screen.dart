import 'package:flutter/material.dart';
import 'package:noon_clone/shared/Components/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                return const CartProductItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0);
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
