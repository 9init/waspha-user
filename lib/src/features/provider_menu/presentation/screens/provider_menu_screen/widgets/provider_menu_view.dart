import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/provider_menu/presentation/screens/provider_menu_screen/widgets/index.dart';


class ProviderMenuView extends StatelessWidget {
  const ProviderMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 21),
      children: [
        ProviderSectionRow(
          sectionName: context.localization.offers,
          seeAllCallBack: () {},
        ),
        SizedBox(
          height: 195.h,
          child: SectionView(
            childWidget: ProductView(
              productImage: MyAssets.images.providerMenu.offers.path,
              productOfferTitle: 'Product Offer',
            ),
          ),
        ),
        ProviderSectionRow(
          sectionName: context.localization.trending_products,
          seeAllCallBack: () {},
        ),
        SizedBox(
          height: 195.h,
          child: SectionView(
            childWidget: ProductView(
              productImage: MyAssets.images.providerMenu.trendingProducts.path,
              productOfferTitle: 'Product Name',
            ),
          ),
        ),
        ProviderSectionRow(
          sectionName: context.localization.category,
          seeAllCallBack: () {},
        ),
        SizedBox(
          height: 195.h,
          child: SectionView(
            width: 156.w,
            childWidget: ProductView(
              productImage: MyAssets.images.providerMenu.category.path,
              productOfferTitle: 'Product Name',
            ),
          ),
        ),
      ],
    );
  }
}
