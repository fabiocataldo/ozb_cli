import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:provider/provider.dart';

class CartNotification extends StatelessWidget {
  const CartNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cart, _) => Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          if (cart.notificationCount > 0)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.notificationColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  cart.notificationCount.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CartNotifier extends ChangeNotifier {
  int notificationCount = 0;

  void incrementNotificationCount() {
    notificationCount++;
    notifyListeners();
  }

  void clearNotificationCount() {
    notificationCount = 0;
    notifyListeners();
  }
}
