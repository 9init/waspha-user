import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black,
      child: IconButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        onPressed: () => context.pop(),
        icon: Icon(Icons.close),
      ),
    );
  }
}
