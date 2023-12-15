import 'package:flutter/material.dart';

extension wrapInColumn on Column {
  Widget PaddingColumn({
    double paddingRight = 0.0,
    double paddingLeft = 0.0,
    double paddingBottom = 0.0,
    double paddingTop = 0.0,
    double margin = 0.0,
  }) {
    final reversedChildren = children
        .map(
          (e) => Container(
        padding: EdgeInsets.only(
          right: paddingRight,
          left: paddingLeft,
          bottom: paddingBottom,
          top: paddingTop,
        ),
        margin: EdgeInsets.all(margin),
        child: e,
      ),
    )
        .toList();
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: reversedChildren,
    );
  }
}

extension wrapInRow on Row {
  Widget paddingRow({
    double paddingRight = 0.0,
    double paddingLeft = 0.0,
    double paddingBottom = 0.0,
    double paddingTop = 0.0,
    double margin = 0.0,
  }) {
    final reversedChildren = children
        .map(
          (e) => Container(
        padding: EdgeInsets.only(
          right: paddingRight,
          left: paddingLeft,
          bottom: paddingBottom,
          top: paddingTop,
        ),
        margin: EdgeInsets.all(margin),
        child: e,
      ),
    )
        .toList();
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: reversedChildren,
    );
  }
}


extension WrapCenter on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }
}
