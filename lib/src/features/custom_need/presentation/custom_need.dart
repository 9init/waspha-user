// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/custom_need/presentation/pickup_confirmation_dialog.dart';
import 'package:waspha/src/widgets/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:waspha/src/widgets/nearby_store/nearby_store_widget.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';
import 'package:waspha/src/widgets/toast_manager/toast_manager.dart';

import '../../../constants/constants.dart';
import '../../../widgets/categories/categories_widget.dart';
import '../../../widgets/need_login.dart';
import '../../login/domain/login_domain.dart';
import '../../menu/menu_detail/presentation/menu_detail.dart';
import '../../nearby_stores/domain/stores_repository.dart';
import '../data/item_data.dart';
import 'delivery_confimration_dialog.dart';
import 'item_widget.dart';
import 'select_date.dart';

final itemsProvider = StateProvider<List<Item>>((ref) => []);

class CustomNeedScreen extends StatefulHookConsumerWidget {
  final isMenu;

  CustomNeedScreen({super.key, required this.isMenu});

  @override
  ConsumerState<CustomNeedScreen> createState() => _CustomNeedScreenState();
}

final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class _CustomNeedScreenState extends ConsumerState<CustomNeedScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: CustomBackButton(isGoFromMainScreen:true,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final subCategory = ref.watch(subCategoryProvider);
                          final category = ref.watch(categoryProvider);

                          return Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImageWidget(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    imageUrl: '${category["image"]}',
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImageWidget(
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      imageUrl: '${subCategory["image"]}'),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final method = ref.watch(methodProvider);
                        final subCategory = ref.watch(subCategoryProvider);
                        final category = ref.watch(categoryProvider);

                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "${capitalize(method)} direct request \n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "${category["name"]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              WidgetSpan(child: Icon(Icons.arrow_forward)),
                              TextSpan(
                                  text: "${subCategory["name"]} \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  width: 370,
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
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Text(context.localization.craft_your_request,
                            style: Theme.of(context).textTheme.titleSmall),
                        Spacer(),
                        Visibility(
                          visible: widget.isMenu,
                          child: Consumer(builder: (context, ref, child) {
                            final storeID = ref.watch(storeIDProvider);
                            print("ID: $storeID");
                            return GestureDetector(
                              onTap: () {
                                context.push('/menu-offer', extra: storeID);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/nearby/menu.png'),
                                  Text("Menu")
                                ],
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final items = ref.watch(itemsProvider);

                          return GestureDetector(
                            onTap: () {
                              String newItemId = UniqueKey().toString();
                              items.insert(
                                0,
                                new Item(
                                    id: newItemId,
                                    deleteCallback: (item) {
                                      items.remove(item);
                                      debugPrint(
                                          'The Item After Removed Is $items');
                                      setState(() {});
                                    }),
                              );
                              setState(() {});
                              debugPrint('The Item Before Removed Is $items');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/nearby/menu.png'),
                                Text(
                                  context.localization.add_new_item_button,
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          width: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer(builder: (context, ref, child) {
                  final items = ref.watch(itemsProvider);
                  return FormBuilder(
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: items.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                      itemBuilder: (context, index) => CreateItemWidget(
                        item: items[index],
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  child: Consumer(builder: (context, ref, child) {
                    final items = ref.watch(itemsProvider);
                    return Visibility(
                      visible: items.isNotEmpty,
                      child: ReadyRequestButton(
                        items: items,
                        isScheduled: isScheduled,
                        formKey: _formKey,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
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
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.isGoFromMainScreen=false,
  });

  final Color backgroundColor, foregroundColor;
  final bool? isGoFromMainScreen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        width: 42,
        height: 42,
        child: IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          onPressed: isGoFromMainScreen==true?()=>context.go('/'):() => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}

class ReadyRequestButton extends StatefulHookWidget {
  const ReadyRequestButton({
    super.key,
    required this.items,
    required this.isScheduled,
    required this.formKey,
  });

  final List<Item> items;
  final ValueNotifier<bool> isScheduled;
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<ReadyRequestButton> createState() => _ReadyRequestButtonState();
}

class _ReadyRequestButtonState extends State<ReadyRequestButton> {
  @override
  Widget build(BuildContext context) {
    final _selectedDate = useState(DateTime.now());

    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: () {
          if (widget.items.isEmpty ||
              widget.items.any((item) => !item.isValid())) {
            debugPrint('Complete All Items First');
            di<ToastManager>()
                .error(context.localization.please_complete_all_items_first);
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  final method = ref.watch(methodProvider);
                  final itemsJsonList =
                      widget.items.map((item) => item.toJson()).toList();
                  final currentPlace = ref.watch(currentPlaceDescription);

                  if (method == "delivery")
                    return DeliveryConfirmationDialog(
                        consumer: ref,
                        items: widget.items,
                        method: method,
                        currentPlace: currentPlace,
                        isScheduled: widget.isScheduled,
                        itemsJsonList: itemsJsonList);

                  return PickupConfirmationDialog(
                      consumer: ref,
                      items: widget.items,
                      method: method,
                      currentPlace: currentPlace,
                      isScheduled: widget.isScheduled,
                      itemsJsonList: itemsJsonList);
                });

            // final itemsJsonList =
            //     items.value.map((item) => item.toJson()).toList();
            // print(itemsJsonList);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xff663399),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: widget.isScheduled.value ? 3 : 6,
                        child: SizedBox(
                          child: Center(
                            child: Text(
                                widget.isScheduled.value
                                    ? context.localization.schedule
                                    : context.localization.ready_for_request,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ),
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: widget.isScheduled.value ? 6 : 3,
                      child: Consumer(
                        builder: (context, ref, child) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(),
                                  dropdownColor: Colors.grey[200],
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  value: widget.isScheduled.value
                                      ? ref.watch(selectedTimeProvider)
                                      : context.localization.now,
                                  hint: Text("df"),
                                  items: [
                                    DropdownMenuItem(
                                      value: context.localization.now,
                                      child: Center(
                                        child: Text(
                                          context.localization.now,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontWeight:
                                                    AppDimensions.regular,
                                              ),
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: widget.isScheduled.value
                                          ? ref.watch(selectedTimeProvider)
                                          : context.localization.scheduled,
                                      child: Center(
                                        child: Text(
                                          widget.isScheduled.value
                                              ? ref.watch(selectedTimeProvider)
                                              : context.localization.scheduled,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontWeight:
                                                    AppDimensions.regular,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) async {
                                    if (value ==
                                        context.localization.scheduled) {
                                      widget.isScheduled.value = true;
                                      final pickedDate =
                                          await DatePicker.showDateTimePicker(
                                        context,
                                        onChanged: (date) {
                                          // Handle date changes if needed
                                        },
                                        onConfirm: (date) {
                                          setState(() {
                                            _selectedDate.value =
                                                date; // Update the selected start date
                                            String formattedDate = DateFormat(
                                                    'yyyy/MM/dd,HH:mm')
                                                .format(_selectedDate.value);

                                            ref
                                                .watch(selectedTimeProvider
                                                    .notifier)
                                                .update(
                                                    (state) => formattedDate);
                                            debugPrint(
                                                'The Selected Date Is ${_selectedDate.value} ');
                                          });
                                        },
                                        currentTime: _selectedDate
                                            .value, // Use the selected start date
                                      );

                                      if (pickedDate == null) {
                                        debugPrint('Something went wrong');
                                      }

                                      // context.push('/select_date');
                                    } else {
                                      widget.isScheduled.value = false;
                                    }
                                  }),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

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
          icon: Icon(Icons.close)),
    );
  }
}
