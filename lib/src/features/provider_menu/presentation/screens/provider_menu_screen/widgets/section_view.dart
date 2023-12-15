import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionView extends StatelessWidget {
  const SectionView({Key? key, required this.childWidget, this.width})
      : super(key: key);
  final Widget childWidget;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => SizedBox(
        height: 192.h,
        width: width ?? 300.w,
        child: childWidget,
      ),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: 15.w,
      ),
    );
  }
}
