import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:waspha/src/features/profile/domain/profile_domain.dart';

import '../../../widgets/auth_btn/auth_btn.dart';

class UpdateProfile extends StatelessWidget {
  final data;
  UpdateProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: data["name"] ?? "");
    final TextEditingController _emailcontroller =
        TextEditingController(text: data["name"] ?? "");
    final PhoneController mobileController = PhoneController(PhoneNumber(
      isoCode: data["iso"] ?? IsoCode.KW,
      nsn: data["nsn"] ?? "",
    ));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft, child: CustomBackButton()),
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Column(
                    children: [
                      data["isNumber"]
                          ? PhoneFormField(
                              controller: mobileController,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: UnderlineInputBorder(),
                              ),
                              showFlagInInput: true,
                              defaultCountry: IsoCode.KW,
                            )
                          : TextFormField(
                              controller: data["isEmail"] == true
                                  ? _emailcontroller
                                  : _controller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: data["isEmail"] == true
                                      ? "Email"
                                      : 'Name',
                                  suffixIcon: Icon(Icons.delete)),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                          visible: data["isNumber"],
                          child: Text(
                              "A verification code will be sent to this number")),
                      SizedBox(
                        height: 40,
                      ),
                      Consumer(
                        builder: (context, ref, child) => WasphaButton(
                          onTap: () {
                            ref.read(editProfileProvider(
                                userName: _controller.text,
                                dob: "1990-09-20T00:00:00.000Z",
                                context: context));
                            ref.refresh(getProfileDataProvider(context)).value;
                          },
                          text: "Continue",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateGender extends StatelessWidget {
  const UpdateGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer(
            builder: (context, ref, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topLeft, child: CustomBackButton()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Update Gender",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    ref.read(editProfileProvider(
                        userName: "",
                        gender: "male",
                        dob: "",
                        context: context));
                    ref.refresh(getProfileDataProvider(context)).value;
                  },
                  title: Text("Male"),
                ),
                ListTile(
                  onTap: () {
                    ref.read(editProfileProvider(
                        userName: "",
                        gender: "female",
                        dob: "",
                        context: context));
                    ref.refresh(getProfileDataProvider(context)).value;
                  },
                  title: Text("Female"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateDOB extends HookWidget {
  const UpdateDOB({super.key});

  @override
  Widget build(BuildContext context) {
    final _focusedDate = useState(DateTime.now());
    final _selectedDate = useState(DateTime.now());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: CustomBackButton()),
            SizedBox(
              height: 20,
            ),
            Text(
              "Update Date of Birth",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
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
                print(selectedDay.toUtc());
                _focusedDate.value = focusedDay;
                _selectedDate.value = selectedDay;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Consumer(
              builder: (context, ref, child) => WasphaButton(
                onTap: () {
                  ref.read(editProfileProvider(
                      userName: '',
                      dob: "${_selectedDate.value.toUtc()}",
                      context: context));
                  ref.refresh(getProfileDataProvider(context)).value;
                },
                text: "Continue",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
