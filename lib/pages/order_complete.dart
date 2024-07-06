import 'package:flutter/material.dart';
import 'package:simple_shop_app/pages/product_page.dart';

class OrderSuccessfulPage extends StatefulWidget {
  const OrderSuccessfulPage({super.key});

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              './assets/tick.png',
              height: 100,
            ),
            Center(
              child: Text('Your order was successful!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            FilledButton.icon(
              style: const ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (_) {
                  return const ProductPage();
                }));
              },
              label: const Text('Back to Shopping'),
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}
