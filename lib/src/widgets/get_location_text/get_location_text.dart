import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/get_location/domain/get_location_domain.dart';

class GetLocationText extends StatelessWidget {
  const GetLocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) => GestureDetector(
            onTap: () {
              ref
                  .read(isPickingLocationProvider.notifier)
                  .update((state) => true);
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(child: Text("Select location from map")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
