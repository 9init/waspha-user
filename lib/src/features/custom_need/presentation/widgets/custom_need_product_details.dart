import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/constants/constants.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';
import 'package:waspha/src/widgets/categories/categories_widget.dart';
import 'package:waspha/src/widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:waspha/src/widgets/nearby_store/nearby_store_widget.dart';
class CustomNeedProductDetails extends ConsumerWidget {
  const CustomNeedProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final method = ref.watch(methodProvider);
    final subCategory = ref.watch(subCategoryProvider);
    final category = ref.watch(categoryProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          height: 100.w,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImageWidget(
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.cover,
                    imageUrl: '${category["image"]}',
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 20.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImageWidget(
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                      imageUrl: '${subCategory["image"]}'),
                ),
              )
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: capitalize(method) + context.localization.direct_request,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "${category["name"]}",
                  style: Theme.of(context).textTheme.titleMedium),
              WidgetSpan(
                child: Icon(Icons.arrow_forward),
              ),

              TextSpan(
                  text: "${subCategory["name"]} \n",
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
