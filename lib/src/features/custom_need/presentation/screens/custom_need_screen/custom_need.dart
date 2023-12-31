import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/providers/item_list_provider.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/index.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';
import '../../../../../widgets/need_login.dart';
import '../../../../login/domain/login_domain.dart';
import '../../../data/item_data.dart';
import '../../item_widget.dart';

class CustomNeedScreen extends HookConsumerWidget {
  final bool isMenu;

  CustomNeedScreen({super.key, required this.isMenu});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Item> newItemList = ref.watch(itemListProvider);
    final isScheduled = useState(false);
    final isLogged = ref.watch(isLoggedInProvider);

    return isLogged.when(
      data: (data) {
        if (data == false) {
          return NeedLoginScreen();
        }
        return Scaffold(
          body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomBackButton(
                    isGoFromMainScreen: true,
                  ),
                ),
                CustomNeedProductDetails(),
                SizedBox(
                  height: 20.h,
                ),
                AddNewItem(isMenu: isMenu,),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: newItemList.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (context, index) => CreateItemWidget(
                    item: newItemList[index],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Visibility(
                  child: Visibility(
                    visible: newItemList.isNotEmpty,
                    child: ReadyRequestButton(
                      items: newItemList,
                      isScheduled: isScheduled,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        );
      },
      error: (e, s) {
        return Text("Error");
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}



