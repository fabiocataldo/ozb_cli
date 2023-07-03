import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';

class ItemAmount extends StatefulWidget {
  final double price;

  const ItemAmount({Key? key, required this.price}) : super(key: key);

  @override
  ItemAmountState createState() => ItemAmountState();
}

class ItemAmountState extends State<ItemAmount> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  double getTotalPrice() {
    return widget.price * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '£${getTotalPrice().toStringAsFixed(2)}',
          style: const TextStyle(
              fontSize: 24,
              color: AppColors.modalColor,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.remove_outlined),
          onPressed: decrement,
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.add_outlined),
          onPressed: increment,
        ),
      ],
    );
  }
}
