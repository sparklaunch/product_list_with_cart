import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_list_with_cart/components/product_thumbnail_item.dart';
import 'package:product_list_with_cart/models/product.dart';

class ConfirmScreen extends StatelessWidget {
  final Map<Product, int> cart;
  final void Function() resetCart;
  const ConfirmScreen({super.key, required this.cart, required this.resetCart});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/OrderConfirmed.svg"),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Order Confirmed",
              style: TextStyle(
                fontSize: 48,
                color: Colors.black,
                fontVariations: [
                  FontVariation("wght", 900),
                ],
              ),
            ),
            const Text(
              "We hope you enjoy your food!",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(111, 107, 104, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(251, 247, 244, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ...cart.keys
                        .map((product) => ProductThumbnailItem(product, cart)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Order Total",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${getTotal().toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 32, fontVariations: [
                            FontVariation("wght", 900),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(193, 52, 16, 1),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.pop(context);
                resetCart();
              },
              child: const Text("Start New Order"),
            )
          ],
        ),
      ),
    );
  }

  double getTotal() {
    double amount = 0;
    for (Product product in cart.keys) {
      amount += product.price * (cart[product] as int);
    }
    return amount;
  }
}
