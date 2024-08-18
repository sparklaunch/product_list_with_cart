import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_list_with_cart/models/product.dart';
import 'package:product_list_with_cart/screens/confirm_screen.dart';

class Cart extends StatelessWidget {
  final void Function(Product product) removeFromCart;
  final void Function() resetCart;
  final Map<Product, int> cart;
  const Cart(this.cart,
      {super.key, required this.removeFromCart, required this.resetCart});

  @override
  Widget build(BuildContext context) {
    final int productCount = cart.values.fold(0, (a, b) => a + b);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your Cart ($productCount)",
          style: const TextStyle(
            fontSize: 28,
            fontVariations: [
              FontVariation("wght", 900),
            ],
            color: Color.fromRGBO(193, 52, 16, 1),
          ),
        ),
        const SizedBox(height: 10),
        ...cart.keys.map(
          (key) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            key.subname,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "${cart[key].toString()}x",
                                style: const TextStyle(
                                  color: Color.fromRGBO(193, 52, 16, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "@ \$${key.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(130, 110, 110, 1),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "\$${(key.price * (cart[key] as int)).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(130, 110, 110, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          removeFromCart(key);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(131, 115, 115, 1),
                            ),
                          ),
                          child:
                              SvgPicture.asset("assets/images/RemoveItem.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(255, 245, 245, 1),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Order Total",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$${getTotal().toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 32,
                fontVariations: [
                  FontVariation("wght", 900),
                ],
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 247, 244, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/CarbonNeutral.svg"),
                const SizedBox(width: 10),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "This is a "),
                      TextSpan(
                        text: "carbon-neutral",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " delivery"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color.fromRGBO(193, 52, 16, 1),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return ConfirmScreen(
                  cart: cart,
                  resetCart: resetCart,
                );
              },
            );
          },
          child: const Text("Confirm Order"),
        )
      ],
    );
  }

  double getTotal() {
    double total = 0;
    for (Product product in cart.keys) {
      total += product.price * cart[product]!;
    }
    return total;
  }
}
