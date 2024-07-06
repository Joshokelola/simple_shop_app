import 'package:flutter/material.dart';
import 'package:simple_shop_app/model/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

void addToCart(String productName, productPrice, productImage) {
  var product =
      Product(name: productName, price: productPrice, image: productImage);
  cartItems.add(product);
}

class _ProductPageState extends State<ProductPage> {
  var items = products;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    items[index].image,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(items[index].name),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    items[index].price,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.maxFinite,
                      child: FilledButton(
                          style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                          ),
                          onPressed: () {
                            addToCart(items[index].name, items[index].price,
                                items[index].image);
                          },
                          child: const Text('Add to cart')))
                ],
              ),
            );
          }),
    );
  }
}
