import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final selectedTimeProvider = StateProvider<String>((ref) => '');

class SelectDateScreen extends ConsumerStatefulWidget {
  const SelectDateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectDateScreen();
}

class _SelectDateScreen extends ConsumerState<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    final _focusedDate = useState(DateTime.now());
    final _selectedDate = useState(DateTime.now());

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDate.value,
              selectedDayPredicate: (day) =>
                  isSameDay(day, _selectedDate.value),
              onPageChanged: (focusedDay) {
                _focusedDate.value = focusedDay;
              },
              onDaySelected: (selectedDay, focusedDay) {
                print(DateFormat.yMd().format(selectedDay));
                _focusedDate.value = focusedDay;
                _selectedDate.value = selectedDay;
              },
            ),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then(
                        (value) {
                      if (value != null) {
                        String time = value.format(context);
                        String formattedDate = DateFormat.yMd().format(_selectedDate.value);
                        String timeString = "${formattedDate} $time";
                        debugPrint(timeString);
                        debugPrint('The Selection Time Is $time');
                        debugPrint('The Selection Time In String Is $timeString');
                        ref.watch(selectedTimeProvider.notifier).update((state) => timeString);
                        debugPrint('selectedTimeProvider $selectedTimeProvider');
                      } else {
                        // Handle the case when the user cancels the time picker
                        // Provide a default time, for example, the current time
                        String defaultTime = TimeOfDay.now().format(context);
                        String formattedDate = DateFormat.yMd().format(_selectedDate.value);
                        String defaultTimeString = "${formattedDate} $defaultTime";
                        debugPrint(defaultTimeString);
                        debugPrint('The Default Time Is $defaultTime');
                        debugPrint('The Default Time In String Is $defaultTimeString');
                        ref.watch(selectedTimeProvider.notifier).update((state) => defaultTimeString);
                        debugPrint('selectedTimeProvider $selectedTimeProvider');
                      }
                    },
                  );
                },
                child: Text("Next"),
              ),
            )
          ],
        ),
      )),
    );

  }
}
