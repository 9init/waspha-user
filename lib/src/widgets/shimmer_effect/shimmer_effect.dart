import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: List.generate(
          3,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.h,
                width: 135.w,
                decoration: BoxDecoration(
                    color: WasphaColors.darkGrey,
                    borderRadius: BorderRadius.circular(5.r)),
              ),
              Column(
                children: List.generate(
                  3,
                  (index) => Container(
                    height: 10.h,
                    width: 175.w,
                    decoration: BoxDecoration(
                      color: WasphaColors.darkGrey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              )
                  .PaddingColumn(
                      paddingRight: 10, paddingLeft: 10, paddingTop: 20)
                  .center(),
            ],
          ),
        ),
      ).PaddingColumn(paddingRight: 10, paddingLeft: 10, paddingTop: 20),
    );
  }
}
