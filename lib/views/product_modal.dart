import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ozb_cli/components/add_bag_button.dart';
import 'package:ozb_cli/components/item_amount.dart';
import 'package:ozb_cli/components/rating_stars.dart';
import 'package:ozb_cli/utils/constants.dart';

class ProductModal extends StatefulWidget {
  final String networkImage;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int reviews;

  const ProductModal({
    Key? key,
    required this.networkImage,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  State<ProductModal> createState() => _ProductModalState();
}

class _ProductModalState extends State<ProductModal> {
  @override
  void initState() {
    checkFavoriteStatus();
    super.initState();
  }

  bool isFavorite = false;
  // bool isFavoriteFromFirebase = false;

  Future<void> checkFavoriteStatus() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final CollectionReference favoritesCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('favorites');

      final QuerySnapshot snapshot = await favoritesCollection
          .where('title', isEqualTo: widget.title)
          .get();

      setState(() {
        isFavorite = snapshot.docs.isNotEmpty;
      });
    }
  }

  void saveFavoriteProduct() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final CollectionReference favoritesCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('favorites');

      final QuerySnapshot snapshot = await favoritesCollection
          .where('title', isEqualTo: widget.title)
          .get();

      if (snapshot.docs.isEmpty) {
        await favoritesCollection.add({
          'networkImage': widget.networkImage,
          'title': widget.title,
          'description': widget.description,
          'price': widget.price,
          'rating': widget.rating,
          'reviews': widget.reviews,
        });
      }
    }
  }

  void deleteFavoriteProduct(String title) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final CollectionReference favoritesCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('favorites');

      final QuerySnapshot snapshot =
          await favoritesCollection.where('title', isEqualTo: title).get();

      for (final DocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Image.network(
            widget.networkImage,
            fit: BoxFit.scaleDown,
            height: 250,
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.modalColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                RatingStars(rating: widget.rating),
                const SizedBox(
                  width: 15,
                ),
                const Text('|'),
                const SizedBox(
                  width: 15,
                ),
                Text('${widget.reviews.toString()} reviews'),
                const Spacer(),
                IconButton(
                  iconSize: 28,
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      if (isFavorite) {
                        // Adicionar o produto à lista de favoritos no Firebase
                        saveFavoriteProduct();
                      } else {
                        // Remover o produto da lista de favoritos no Firebase
                        deleteFavoriteProduct(widget.title);
                      }
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ItemAmount(price: widget.price),
          ),
          const AddBagButton()
        ],
      ),
    );
  }
}

void openSlidingPanel(BuildContext context, String networkImage, String title,
    String description, double price, double rating, int reviews) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 1.0,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return AnimationLimiter(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 100.0,
                    child: FadeInAnimation(
                      child: ProductModal(
                        networkImage: networkImage,
                        title: title,
                        description: description,
                        price: price,
                        rating: rating,
                        reviews: reviews,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    },
  );
}
