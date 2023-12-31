import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/features/custom_need/presentation/delivery_confimration_dialog.dart';
import 'package:waspha/src/features/custom_need/presentation/pickup_confirmation_dialog.dart';
import 'package:waspha/src/features/custom_need/presentation/select_date.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';
import 'package:waspha/src/widgets/toast_manager/toast_manager.dart';

class ReadyRequestButton extends StatefulHookWidget {
  const ReadyRequestButton({
    super.key,
    required this.items,
    required this.isScheduled,
  });

  final List<Item> items;
  final ValueNotifier<bool> isScheduled;

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
