import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ozb_cli/components/product_box.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:ozb_cli/views/product_modal.dart';
import '../components/ads_banner.dart';

class FavoriteScreen extends StatefulWidget {
  final Orientation orientation;

  const FavoriteScreen({Key? key, required this.orientation}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Stream<List<ProductModal>> favoriteProductsStream;

  int gridCrossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    favoriteProductsStream = getFavoriteProducts();
  }

  Stream<List<ProductModal>> getFavoriteProducts() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final CollectionReference favoritesCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('favorites');

      return favoritesCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductModal(
            networkImage: data['networkImage'] as String? ?? '',
            title: data['title'] as String? ?? '',
            description: data['description'] as String? ?? '',
            price: (data['price'] as num?)?.toDouble() ?? 0.0,
            rating: (data['rating'] as num?)?.toDouble() ?? 0.0,
            reviews: data['reviews'] as int? ?? 0,
          );
        }).toList();
      });
    } else {
      return Stream.value([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double childAspectRatio;

    if (widget.orientation == Orientation.portrait) {
      childAspectRatio = 0.6;
    } else {
      childAspectRatio = 1.4;
    }

    return Column(
      children: [
        const AdsBanner(),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  gridCrossAxisCount = 2;
                });
              },
              icon: const Icon(Icons.grid_view),
              color:
                  gridCrossAxisCount == 2 ? AppColors.modalColor : Colors.grey,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  gridCrossAxisCount = 1;
                });
              },
              icon: const Icon(Icons.list),
              color:
                  gridCrossAxisCount == 1 ? AppColors.modalColor : Colors.grey,
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<ProductModal>>(
            stream: favoriteProductsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                final favoriteProductsList = snapshot.data ?? [];

                if (favoriteProductsList.isEmpty) {
                  return const Center(child: Text('No Favorites Yet :('));
                }

                return GridView.builder(
                  itemCount: favoriteProductsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCrossAxisCount,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    final product = favoriteProductsList[index];

                    return ProductBox(
                      networkImage: product.networkImage,
                      title: product.title,
                      description: product.description,
                      price: product.price,
                      rating: product.rating,
                      reviews: product.reviews,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
