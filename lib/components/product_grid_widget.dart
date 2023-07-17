import 'package:flutter/material.dart';
import 'package:ozb_cli/components/ads_banner.dart';
import 'package:ozb_cli/components/carousel_filter.dart';
import 'package:ozb_cli/components/product_box.dart';
import 'package:ozb_cli/models/product_list_model.dart';
import 'package:ozb_cli/utils/constants.dart';
import 'package:ozb_cli/view_models/product_view_model.dart';
import '../repo/api_status.dart';
import '../repo/product_service.dart';

class ProductGridWidget extends StatefulWidget {
  final ProductViewModel productViewModel;
  final Orientation orientation;
  final List<ProductList> list;

  const ProductGridWidget({
    Key? key,
    required this.list,
    required this.productViewModel,
    required this.orientation,
  }) : super(key: key);

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  List<ProductList> productList = [];
  List<ProductList> productListFilter = [];
  int gridCrossAxisCount = 2;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getInfo());
  }

  Future<List<ProductList>> _getInfo() async {
    var response = await ProductService.getProducts();

    productList = response;

    // if (response is Success) {
    //   productList = response;
    //   productListFilter = productList;
    // }

    setState(() {
      productList;
    });
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productViewModel.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    double childAspectRatio;

    if (widget.orientation == Orientation.portrait) {
      childAspectRatio = 0.6;
    } else {
      childAspectRatio = 1.4;
    }

    return Column(
      children: [
        const AdsBanner(),
        // SizedBox(
        //   height: 50,
        //   child: FilterCarousel(
        //     filterOptions: [
        //       'ALL',
        //       Category.ELECTRONICS.name,
        //       Category.JEWELERY.name,
        //       Category.MENS_CLOTHING.name,
        //       Category.WOMENS_CLOTHING.name,
        //     ],
        //     onFilterSelected: (String filter) {
        //       List<ProductList> filteredList = [];

        //       productList = productListFilter;

        //       if (filter == 'ALL') {
        //         filteredList = productList.toList();
        //       } else {
        //         filteredList = productList
        //             .where((product) => product.category.name == filter)
        //             .toList();
        //       }

        //       setState(() {
        //         productList = filteredList;
        //       });
        //     },
        //   ),
        // ),
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
          child: GridView.builder(
            itemCount: productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCrossAxisCount,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return ProductBox(
                networkImage: 'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg',
                title: '',
                description: 'productList[index].description',
                price: 3900,
                rating: 10,
                reviews: 20,
              );
            },
          ),
        )
      ],
    );
  }
}
