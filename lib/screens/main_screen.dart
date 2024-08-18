import 'package:flutter/material.dart';
import 'package:product_list_with_cart/components/cart.dart';
import 'package:product_list_with_cart/components/empty_cart.dart';
import 'package:product_list_with_cart/components/product_item.dart';
import 'package:product_list_with_cart/models/product.dart';
import 'package:product_list_with_cart/models/products.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<Product, int> cart = {};

  void addToCart(Product product) {
    setState(() {
      if (cart.containsKey(product)) {
        cart[product] = (cart[product] as int) + 1;
      } else {
        cart[product] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Desserts",
                style: TextStyle(
                  fontSize: 48,
                  letterSpacing: -1,
                  fontVariations: [
                    FontVariation("wght", 900),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ...products.map(
                (product) => ProductItem(product, addToCart: addToCart),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: cart.isEmpty
                      ? const EmptyCart()
                      : Cart(
                          cart,
                          removeFromCart: removeFromCart,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }
}
