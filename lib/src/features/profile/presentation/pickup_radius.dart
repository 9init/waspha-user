import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/profile/domain/pickup_radius.domain.dart';
import 'package:waspha/src/widgets/auth_btn/auth_btn.dart';

class PickupRadius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup Radius",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "You cab adjust your preferred pickup radius. "
              "This controls the distance from your current location "
              "within which available providers will be displayed "
              "for you to send requests and receive offers",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text:
                    "Define the distance by sliding the bar - you can choose a distance of up to ", // Common text
                style: TextStyle(fontSize: 17, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: "20 km",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            PickupRadiusSlider(),
            Spacer(), // Spacer to push the button to the bottom
            Consumer(builder: (context, ref, _) {
              final radiusProvider = ref.watch(pickupRadiusProvider);
              return WasphaButton(
                onTap: () => radiusProvider.savePickupRadius(),
                text: "Confirm",
              );
            })
          ],
        ),
      ),
    );
  }
}

class PickupRadiusSlider extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickupRadiusSlider();
}

class _PickupRadiusSlider extends ConsumerState<PickupRadiusSlider> {
  @override
  void initState() {
    Future(() async {
      final radiusProvider = ref.read(pickupRadiusProvider);
      radiusProvider.setPickupRadius(radiusProvider.pickupRadius);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final radiusProvider = ref.watch(pickupRadiusProvider);
    final pickupRadius = radiusProvider.tempPickupRadius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text info with bold "Maximum distance to pickup" and the value with km
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Maximum distance to pickup',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '$pickupRadius km',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        // Slider component with values from 1 to 20
        Container(
          child: Slider(
            value: pickupRadius.toDouble(),
            min: 1,
            max: 20,
            onChanged: (value) {
              radiusProvider.setPickupRadius(value.toInt());
            },
          ),
        ),
      ],
    );
  }
}
