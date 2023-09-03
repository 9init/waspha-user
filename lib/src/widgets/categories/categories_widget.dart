import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../map_card/map_cards.dart';

class CategoriesWidget extends HookWidget {
  const CategoriesWidget({
    super.key,
    required this.dataLength,
    required this.category,
    required this.categoryName,
    required this.isClicked,
    required this.isSubCategoryClicked,
  });

  final int dataLength;
  final category;
  final categoryName;
  final isClicked;
  final isSubCategoryClicked;

  @override
  Widget build(BuildContext context) {
    final catsCloned = useState([...categoryName]);

    return GestureDetector(
      onTap: () {
        isClicked.value = !isClicked.value;
      },
      child: Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: ListView.separated(
              itemCount: dataLength,
              separatorBuilder: (context, index) => SizedBox(
                width: isClicked.value ? 0 : 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  isSubCategoryClicked.value = false;
                  category.value = index;
                  isClicked.value = !isClicked.value;

                  if (isClicked.value) {
                    catsCloned.value = [...categoryName];
                    catsCloned.value.removeAt(category.value);
                    catsCloned.value.add(categoryName[category.value]);
                  }
                },
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  widthFactor: !isClicked.value ? 1 : 0.1,
                  alignment: Alignment.bottomLeft,
                  child: MapCard(
                    dataLength: dataLength,
                    categoryName: categoryName,
                    categoryNameCloned: catsCloned.value,
                    index: index,
                    category: category,
                    isClicked: isClicked,
                    name: categoryName[index].name["en"],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
