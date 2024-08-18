import 'package:flutter/material.dart';
import 'package:product_list_with_cart/models/product.dart';

class ProductThumbnailItem extends StatelessWidget {
  final Map<Product, int> cart;
  final Product product;
  const ProductThumbnailItem(this.product, this.cart, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/${product.imageName}Thumbnail.jpg",
                  width: 70,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.subname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "${cart[product].toString()}x",
                        style: const TextStyle(
                          color: Color.fromRGBO(193, 52, 16, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "@ \$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(117, 97, 95, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text(
                "\$${(product.price * (cart[product] as int)).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontVariations: [
                    FontVariation("wght", 600),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
        ],
      ),
    );
  }
}
