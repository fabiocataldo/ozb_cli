import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:ozb_cli/views/product_modal.dart';

class ProductBox extends StatelessWidget {
  final String networkImage;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int reviews;

  const ProductBox({
    Key? key,
    required this.networkImage,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openSlidingPanel(
            context, networkImage, title, description, price, rating, reviews);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  networkImage,
                  fit: BoxFit.scaleDown,
                  height: 150,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '£${price.toString()}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.addButton,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
