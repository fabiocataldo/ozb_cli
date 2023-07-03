import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';

class FilterCarousel extends StatefulWidget {
  final List<String> filterOptions;
  final Function(String) onFilterSelected;

  const FilterCarousel({
    Key? key,
    required this.filterOptions,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  FilterCarouselState createState() => FilterCarouselState();
}

class FilterCarouselState extends State<FilterCarousel> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.filterOptions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: _selectedFilterIndex == index
                  ? AppColors.white
                  : AppColors.white.withOpacity(0.8),
            ),
            onPressed: () {
              setState(() {
                _selectedFilterIndex = index;
              });
              widget.onFilterSelected(widget.filterOptions[index]);
            },
            child: Text(
              widget.filterOptions[index],
              style: TextStyle(
                color: _selectedFilterIndex == index
                    ? AppColors.modalColor
                    : Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
