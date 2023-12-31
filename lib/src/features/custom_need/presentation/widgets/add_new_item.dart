import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/features/custom_need/presentation/providers/item_list_provider.dart';
import 'package:waspha/src/features/menu/menu_detail/presentation/menu_detail.dart';

class AddNewItem extends StatelessWidget {
  const AddNewItem({Key? key, required this.isMenu}) : super(key: key);
  final bool isMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      height: 90.h,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(context.localization.craft_your_request,
              style: Theme.of(context).textTheme.titleSmall),
          Consumer(builder: (context, ref, child) {
            final storeID = ref.watch(storeIDProvider);
            return Visibility(
              visible: isMenu,
              child: GestureDetector(
                onTap: () {
                  context.push('/menu-offer', extra: storeID);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyAssets.images.nearby.menu.image(),
                    Text(
                      context.localization.menu,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            return GestureDetector(
              onTap: () => ref.read(itemListProvider.notifier).addNewItem(
                    item: Item(),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyAssets.images.nearby.menu.image(),
                  Text(
                    context.localization.add_new_item_button,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            );
          }),
        ],
      ).paddingRow(
          paddingLeft: 15, paddingRight: 15, paddingTop: 10, paddingBottom: 10),
    );
  }
}
