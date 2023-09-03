import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {
  const MapCard({
    super.key,
    this.image,
    this.name,
    required this.isClicked,
    required this.index,
    required this.category,
    required this.dataLength,
    required this.categoryName,
    required this.categoryNameCloned,
  });

  final String? image;
  final String? name;
  final isClicked;
  final int index;
  final category;
  final dataLength;
  final categoryName, categoryNameCloned;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: CachedNetworkImage(
                    imageUrl: isClicked.value
                        ? categoryNameCloned[index].image ?? ""
                        : categoryName[index].image ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.broken_image),
                  ))),
          SizedBox(
            height: 10,
          ),
          Visibility(
              visible: !isClicked.value ||
                  (index == dataLength - 1 && isClicked.value),
              child: Text(
                isClicked.value
                    ? categoryNameCloned[index].name["en"]
                    : categoryName[index].name["en"],
              ))
        ],
      ),
    );
  }
}
