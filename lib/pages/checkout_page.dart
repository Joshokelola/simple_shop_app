import 'package:flutter/material.dart';
import 'package:simple_shop_app/model/product.dart';
import 'package:simple_shop_app/pages/order_complete.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

int getTotalCost() {
  var prices = cartItems.map((e) {
    return int.tryParse(e.price.substring(1)); // Extract integer price
  }).toList();
  var totalCost =
      prices.fold(0, (previousValue, element) => previousValue + element!);
  return totalCost;
}

class _CheckoutPageState extends State<CheckoutPage> {
  int totalCost = 0;

  @override
  void initState() {
    super.initState();
    totalCost = getTotalCost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});

          if (cartItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Cart is empty!'),
              duration: Duration(seconds: 3),
            ));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const OrderSuccessfulPage();
            }));
          }

          cartItems.clear();
        },
        icon: const Icon(Icons.shopping_cart_checkout),
        label: Text('Checkout (\$$totalCost)'),
      ),
      body: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    cartItems[index].image,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItems[index].name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          cartItems[index].price,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(
                          width: 140,
                          child: FilledButton.icon(
                            style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                            ),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                                totalCost = getTotalCost();
                              });
                            },
                            label: const Text('Remove'),
                            icon: const Icon(Icons.delete),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
