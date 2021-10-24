import 'package:flutter/material.dart';
import 'package:noon_clone/models/product_model.dart';

class ProductItem extends StatelessWidget {
  ProductDataModel? productDataModel;

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
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                padding: const EdgeInsets.all(0),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
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
