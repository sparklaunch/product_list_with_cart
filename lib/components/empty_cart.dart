import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Your Cart (0)",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(200, 60, 30, 1),
          ),
        ),
        const SizedBox(height: 30),
        SvgPicture.asset("assets/images/EmptyCart.svg"),
        const SizedBox(height: 30),
        const Text(
          "Your added items will appear here",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(115, 108, 108, 1),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
