import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/src/colors/colors.dart';

class ProductView extends StatelessWidget {
  const ProductView(
      {Key? key, required this.productImage, required this.productOfferTitle})
      : super(key: key);
  final String productImage;
  final String productOfferTitle;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.asset(productImage, fit: BoxFit.cover),
      footer: Container(
        padding: EdgeInsets.only(right: 9, left: 9),
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500.r),
        ),
        child: GridTileBar(
          backgroundColor: WasphaColors.white.withOpacity(0.5),
          title: Text(productOfferTitle),
        ),
      ),
    );
  }
}
