import 'package:flutter/material.dart';
import 'package:product_list_with_cart/models/product.dart';

class ProductItem extends StatelessWidget {
  final void Function(Product product) addToCart;
  final Product product;
  const ProductItem(this.product, {super.key, required this.addToCart});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/${product.imageName}.jpg",
              ),
            ),
            GestureDetector(
              onTap: () {
                addToCart(product);
              },
              child: SizedBox(
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(158, 144, 144, 1),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Color.fromRGBO(128, 75, 60, 1),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(107, 84, 83, 1),
          ),
        ),
        Text(
          product.subname,
          style: const TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(145, 68, 48, 1),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
