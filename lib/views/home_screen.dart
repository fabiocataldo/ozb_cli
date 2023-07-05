import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ozb_cli/components/bottom_nav_bar.dart';
import 'package:ozb_cli/components/cart_notification.dart';
import 'package:ozb_cli/components/nav_drawer.dart';
import 'package:ozb_cli/components/product_grid_widget.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:ozb_cli/view_models/product_view_model.dart';
import 'package:ozb_cli/views/favorite_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    ProductViewModel productViewModel = context.watch<ProductViewModel>();

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        actions: const [
          CartNotification(),
        ],
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Ozb Shop',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IndexedStack(
          index: _currentIndex,
          children: [
            ProductGridWidget(
                productViewModel: productViewModel,
                orientation: MediaQuery.of(context).orientation,
                list: const []),
            FavoriteScreen(
              orientation: MediaQuery.of(context).orientation,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
