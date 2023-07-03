import 'package:flutter/material.dart';
import 'package:ozb_cli/components/cart_notification.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:provider/provider.dart';

class AddBagButton extends StatefulWidget {
  const AddBagButton({super.key});

  @override
  State<AddBagButton> createState() => _AddBagButtonState();
}

class _AddBagButtonState extends State<AddBagButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final cart = Provider.of<CartNotifier>(context, listen: false);
        cart.incrementNotificationCount();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.modalColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(16.0),
        ),
      ),
      child: const Text(
        'Add to Bag',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
    );
  }
}
